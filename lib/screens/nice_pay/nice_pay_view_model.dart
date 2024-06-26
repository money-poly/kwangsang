import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:cp949_codec/cp949_codec.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:immersion_kwangsang/models/nice_payments/nice_accept_req_model.dart';
import 'package:immersion_kwangsang/models/nice_payments/nice_pay_res_model.dart';
import 'package:immersion_kwangsang/services/nice_payments_service.dart';
import 'package:immersion_kwangsang/utils/extensions.dart';

enum ENicePayState {
  paying,
  success,
  failed,
}

class NicePayViewModel with ChangeNotifier {
  final _service = NicePaymentsService();
  late final InAppWebViewController _controller;
  late ENicePayState _status;
  late String _failMsg;

  InAppWebViewController get controller => _controller;
  ENicePayState get status => _status;
  String get failMsg => _failMsg;

  NicePayViewModel() {
    _status = ENicePayState.paying;
    _failMsg = '';
  }

  void initController(InAppWebViewController controller) {
    _controller = controller;
  }

  String getPayReqBody() {
    var code = 'N000001';
    var amt = '100';
    var mid = 'immersionm';

    var now = DateTime.now();
    var ediDate = now.toNiceStr();

    var mkey = dotenv.env["NICE_PAY_KEY"];
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

  Future<dynamic> getPostPayload() async {
    var res = await _controller.evaluateJavascript(
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

    print('POST 요청의 페이로드: $res');

    return res;
  }

  Future<void> postPayAccept({
    required NicePayResModel nicePayRes,
  }) async {
    // TODO: 서버 사이드로 nicePayRes를 보내면 아래의 동작을 수행한 후 응답하면 됨.
    try {
      var now = DateTime.now();
      var ediDate = now.toNiceStr();

      var mkey = dotenv.env["NICE_PAY_KEY"];
      var sha = sha256.convert(utf8.encode(
          '${nicePayRes.authToken}${nicePayRes.mid}${nicePayRes.amt}$ediDate$mkey'));
      var signData = hex.encode(sha.bytes);

      var res = await _service.postAcceptPayments(
        nextAppUrl: nicePayRes.nextAppUrl,
        reqModel: NiceAcceptReqModel(
          tid: nicePayRes.txTid,
          authToken: nicePayRes.authToken,
          mid: nicePayRes.mid,
          amt: nicePayRes.amt,
          ediDate: ediDate,
          signData: signData,
        ),
      );

      // TODO: 결제 성공시 코드들로 변경해야 합니다.
      if (['1512'].contains(res.resultCode)) {
        _status = ENicePayState.success;
      } else {
        _status = ENicePayState.failed;
        _failMsg = cp949.decode(res.resultMsg.codeUnits);
      }
    } catch (e) {
      _status = ENicePayState.failed;
      _failMsg = e.toString();
    } finally {
      notifyListeners();
    }
  }
}
