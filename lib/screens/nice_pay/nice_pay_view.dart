import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immersion_kwangsang/screens/nice_pay/nice_pay_view_model.dart';
import 'package:immersion_kwangsang/screens/nice_pay/widgets/nice_pay_cancel_dialog.dart';
import 'package:immersion_kwangsang/screens/nice_pay/widgets/nice_pay_failed.dart';
import 'package:immersion_kwangsang/screens/nice_pay/widgets/nice_pay_paying.dart';
import 'package:immersion_kwangsang/screens/nice_pay/widgets/nice_pay_success.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:provider/provider.dart';

class NicePayView extends StatelessWidget {
  const NicePayView({super.key});

  void _pop(BuildContext context) async {
    final viewModel = context.read<NicePayViewModel>();
    final controller = viewModel.controller;
    final status = viewModel.status;

    if (status != ENicePayState.paying) {
      Navigator.pop(context);
      return;
    }

    if (await controller.canGoBack()) {
      await controller.goBack();
    } else {
      var res = await showDialog(
        context: context,
        builder: (context) => const NicePayCancelDialog(),
      );
      if (res == true) {
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final status = context.select<NicePayViewModel, ENicePayState>(
      (value) => value.status,
    );

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          _pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("결제", style: KwangStyle.header2),
          toolbarHeight: 52,
          titleSpacing: 8,
          centerTitle: false,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: GestureDetector(
              onTap: () {
                _pop(context);
              },
              child: SvgPicture.asset(
                "assets/icons/ic_36_back.svg",
                width: 36,
                height: 36,
              ),
            ),
          ),
          leadingWidth: 44,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Builder(
          builder: (context) {
            if (status == ENicePayState.success) {
              return const NicePaySuccess();
            }
            if (status == ENicePayState.failed) {
              return const NicePayFailed();
            }
            return const NicePayPaying();
          },
        ),
      ),
    );
  }
}
