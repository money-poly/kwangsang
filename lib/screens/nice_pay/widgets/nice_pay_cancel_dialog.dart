import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';

class NicePayCancelDialog extends StatelessWidget {
  const NicePayCancelDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: KwangColor.grey100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 40),
            Image.asset(
              'assets/imgs/img_44_bird_exclamation.png',
              height: 80,
            ),
            const SizedBox(height: 16),
            Text(
              '결제가 진행 중입니다',
              style: KwangStyle.header3,
            ),
            const SizedBox(height: 8),
            const Text('취소하시겠습니까?'),
            const SizedBox(height: 40),
            Row(
              children: [
                _btn(context, cancel: false),
                _btn(context, cancel: true),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _btn(
    BuildContext context, {
    required bool cancel,
  }) {
    return Flexible(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop(cancel);
        },
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            color: cancel ? KwangColor.grey100 : KwangColor.primary400,
            border: const Border(
              top: BorderSide(
                color: KwangColor.primary400,
                width: 1,
              ),
            ),
          ),
          child: Center(
            child: Text(
              cancel ? '취소할게요' : '아니요',
              style: KwangStyle.btn3SB.copyWith(
                color: cancel ? KwangColor.primary400 : KwangColor.grey100,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
