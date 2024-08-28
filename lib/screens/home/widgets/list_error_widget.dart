import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';

class ListErrorWidget extends StatelessWidget {
  final String message;
  final Function()? onTapRetry;
  final bool isEmptyList;

  const ListErrorWidget({
    super.key,
    required this.message,
    this.onTapRetry,
    this.isEmptyList = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/imgs/img_86_bird_exclamation.png",
          width: 86,
          height: 86,
        ),
        if (isEmptyList)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              "판매 중인 상품이 없어요",
              style: KwangStyle.header2,
            ),
          ),
        Text(
          message.replaceAll('Exception: ', ''),
          style: KwangStyle.body1M.copyWith(
            color: KwangColor.grey600,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: onTapRetry,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              color: KwangColor.primary400,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '재시도',
              style: KwangStyle.btn2B.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
