import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immersion_kwangsang/screens/nice_pay/nice_pay_view_model.dart';
import 'package:immersion_kwangsang/screens/nice_pay/widgets/nice_pay_failed.dart';
import 'package:immersion_kwangsang/screens/nice_pay/widgets/nice_pay_paying.dart';
import 'package:immersion_kwangsang/screens/nice_pay/widgets/nice_pay_success.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:provider/provider.dart';

class NicePayView extends StatelessWidget {
  const NicePayView({super.key});

  @override
  Widget build(BuildContext context) {
    final status = context.select<NicePayViewModel, ENicePayState>(
      (value) => value.status,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("결제", style: KwangStyle.header2),
        toolbarHeight: 52,
        titleSpacing: 8,
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
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
    );
  }
}
