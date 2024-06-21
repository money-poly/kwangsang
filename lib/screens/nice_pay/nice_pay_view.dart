import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:immersion_kwangsang/models/nice_payments/nice_accept_req_model.dart';
import 'package:immersion_kwangsang/models/nice_payments/nice_pay_res_model.dart';
import 'package:immersion_kwangsang/services/nice_payments_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:convert/convert.dart';

// TODO: 레이어 분리 및 함수 모듈화 필요
class NicePayView extends StatelessWidget {
  const NicePayView({super.key});

  String _getRequestBody() {
    var code = 'N000001';
    var amt = '100';
    var mid = 'immersionm';
    var mkey = dotenv.env["NICE_PAY_KEY"];

    var now = DateTime.now();
    var ediDate = '';
    ediDate += now.year.toString().padLeft(4, '0');
    ediDate += now.month.toString().padLeft(2, '0');
    ediDate += now.day.toString().padLeft(2, '0');
    ediDate += now.hour.toString().padLeft(2, '0');
    ediDate += now.minute.toString().padLeft(2, '0');
    ediDate += now.second.toString().padLeft(2, '0');

    var sha = sha256.convert(utf8.encode('$ediDate$mid$amt$mkey'));
    var signData = hex.encode(sha.bytes);

    String result = "";
    result += "GoodsName=$code"; // 결제상품명 (euc-kr)
    result += "&Amt=$amt"; // 금액 (Only number)
    result += "&MID=$mid"; // 상점아이디 ex)nicepay00m
    result += "&EdiDate=$ediDate"; // 요청 시간 (YYYYMMDDHHMISS)
    result += "&Moid=$code"; // 상품주문번호
    result +=
        "&SignData=$signData"; // hex(sha256(EdiDate + MID + Amt + MerchantKey)) , 위변조 검증 데이터
    result +=
        "&PayMethod=CARD"; // CARD: 신용카드 / BANK: 계좌이체 / VBANK: 가상계좌 / CELLPHONE: 휴대폰결제
    result += "&ReturnURL=intent://redirect/pay_request"; // 요청 응답 URL (절대 경로)
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NICE 결제'),
      ),
      body: InAppWebView(
        initialSettings: InAppWebViewSettings(
          cacheEnabled: false,
          clearCache: true,
          resourceCustomSchemes: ['intent'],
        ),
        initialUrlRequest: URLRequest(
          url: WebUri('https://pg-web.nicepay.co.kr/v3/gwPayment.jsp'),
          body: Uint8List.fromList(
            utf8.encode(_getRequestBody()),
          ),
          method: 'POST',
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            'Accept-Charset': "euc-kr",
          },
        ),
        onLoadStop: (controller, url) async {
          var title = await controller.getTitle();
          print(title);
          if (title?.contains('404') == true) {
            Navigator.pop(context);
          }
        },
        onLoadResourceWithCustomScheme: (controller, url) async {
          await controller.stopLoading();

          print('requestUrl: $url');
          if (url.url.toString() == 'intent://redirect/pay_request') {
            var postPayload = await controller.evaluateJavascript(
              source: '''
                (function() {
                  var requestPayload = {};
                  var inputs = document.querySelectorAll('input');
                  inputs.forEach(function(input) {
                    requestPayload[input.name] = input.value;
                  });
                  return JSON.stringify(requestPayload);
                })();
              ''',
            );
            print('POST 요청의 페이로드: $postPayload');
            var resPayload = NicePayResModel.fromJson(
              json.decode(postPayload as String),
            );

            if (resPayload.authResultCode != '0000') {
              Navigator.pop(context);
            } else {
              var mkey = dotenv.env["NICE_PAY_KEY"];

              var now = DateTime.now();
              var ediDate = '';
              ediDate += now.year.toString().padLeft(4, '0');
              ediDate += now.month.toString().padLeft(2, '0');
              ediDate += now.day.toString().padLeft(2, '0');
              ediDate += now.hour.toString().padLeft(2, '0');
              ediDate += now.minute.toString().padLeft(2, '0');
              ediDate += now.second.toString().padLeft(2, '0');

              var sha = sha256.convert(utf8.encode(
                  '${resPayload.authToken}${resPayload.mid}${resPayload.amt}$ediDate$mkey'));
              var signData = hex.encode(sha.bytes);

              var res = await NicePaymentsService().postAcceptPayments(
                nextAppUrl: resPayload.nextAppUrl,
                reqModel: NiceAcceptReqModel(
                  tid: resPayload.txTid,
                  authToken: resPayload.authToken,
                  mid: resPayload.mid,
                  amt: resPayload.amt,
                  ediDate: ediDate,
                  signData: signData,
                ),
              );

              print(res.resultCode);
              print(res.resultMsg);
              print(res.tid);
            }
          }

          // Server side code

          return null;
        },
        shouldOverrideUrlLoading: (controller, navigationAction) async {
          if (!navigationAction.isForMainFrame) {
            await controller.stopLoading();
          }

          String requestUrl = navigationAction.request.url.toString();
          debugPrint('웹뷰 [onUpdateVisitedHistory]: $requestUrl');

          if (!requestUrl.startsWith('http') &&
              !requestUrl.startsWith('https')) {
            if (Platform.isAndroid) {
              var platform = const MethodChannel('net.immersion.kwangsaeng');
              var appUrl = await platform.invokeMethod(
                'getAppUrl',
                <String, Object>{'url': requestUrl},
              );

              if (await canLaunchUrl(Uri.parse(appUrl))) {
                await launchUrl(Uri.parse(appUrl));
              } else {
                print('이동 불가능한 URL입니다.');
              }
              return NavigationActionPolicy.CANCEL;
            } else if (Platform.isIOS) {
              await launchUrl(
                Uri.parse(requestUrl),
              );
              return NavigationActionPolicy.CANCEL;
            }
          }
          return NavigationActionPolicy.ALLOW;
        },
      ),
    );
  }
}
