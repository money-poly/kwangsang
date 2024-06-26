import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:immersion_kwangsang/screens/nice_pay/nice_pay_view_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NicePayPaying extends StatelessWidget {
  const NicePayPaying({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<NicePayViewModel>();

    return InAppWebView(
      initialSettings: InAppWebViewSettings(
        cacheEnabled: false,
        clearCache: true,
        resourceCustomSchemes: ['intent'],
        useHybridComposition: false,
      ),
      // NICE process 1: 결제창 호출
      initialUrlRequest: URLRequest(
        url: WebUri('https://pg-web.nicepay.co.kr/v3/gwPayment.jsp'),
        body: Uint8List.fromList(
          utf8.encode(viewModel.getPayReqBody()),
        ),
        method: 'POST',
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Accept-Charset': "euc-kr",
        },
      ),
      onWebViewCreated: (controller) {
        viewModel.initController(controller);
      },
      onJsAlert: (controller, jsAlertRequest) async {
        return JsAlertResponse(handledByClient: true);
      },
      onLoadStop: (_, url) async {
        var title = await viewModel.controller.getTitle();
        if (title?.contains('404') == true) {
          Navigator.pop(context);
        }
      },
      onLoadResourceWithCustomScheme: (_, url) async {
        await viewModel.controller.stopLoading();

        // NICE process 2: 결제창 응답
        if (url.url.toString() == 'intent://redirect/pay_request') {
          final postPayload = await viewModel.getPostPayload();

          if (postPayload.authResultCode == '0204') {
            // magic number 3...
            await viewModel.controller.goBack();
            await viewModel.controller.goBack();
            await viewModel.controller.goBack();
            return;
          }

          if (postPayload.authResultCode != '0000') {
            viewModel.setError(message: postPayload.authResultMsg);
            return;
          } else {
            // NICE process 3: 승인 API 호출 및 응답
            await viewModel.postPayAccept(nicePayRes: postPayload);
          }
        }

        return;
      },
      shouldOverrideUrlLoading: (_, navigationAction) async {
        if (!navigationAction.isForMainFrame) {
          await viewModel.controller.stopLoading();
        }

        String requestUrl = navigationAction.request.url.toString();
        debugPrint('웹뷰 [onUpdateVisitedHistory]: $requestUrl');

        if (!requestUrl.startsWith('http') && !requestUrl.startsWith('https')) {
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
    );
  }
}
