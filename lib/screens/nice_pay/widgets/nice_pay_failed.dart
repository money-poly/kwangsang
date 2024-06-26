import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/screens/nice_pay/nice_pay_view_model.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:provider/provider.dart';

class NicePayFailed extends StatelessWidget {
  const NicePayFailed({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<NicePayViewModel>();

    return Column(
      children: [
        Expanded(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/imgs/img_44_bird_exclamation.png',
                  height: 80,
                ),
                const SizedBox(height: 16),
                Text(
                  '결제에 실패했습니다.',
                  style: KwangStyle.header3,
                ),
                const SizedBox(height: 8),
                Text(
                  viewModel.failMsg,
                  style: KwangStyle.body3,
                ),
              ],
            ),
          ),
        ),
        SafeArea(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              height: 40,
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: KwangColor.primary400,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  '돌아가기',
                  style: KwangStyle.btn3SB.copyWith(
                    color: KwangColor.grey100,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
