import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/styles/txt.dart';

enum CustomBtnType { small, big }

class CustomBtn extends StatelessWidget {
  const CustomBtn(
      {super.key,
      required this.txt,
      required this.bgColor,
      required this.txtColor,
      required this.unableBgColor,
      required this.unableTxtColor,
      required this.onTap,
      required this.isEnable,
      required this.type});

  final String txt;
  final Color bgColor;
  final Color txtColor;
  final Color unableBgColor;
  final Color unableTxtColor;
  final Function() onTap;
  final bool isEnable;
  final CustomBtnType type;
  @override
  Widget build(BuildContext context) {
    switch (type) {
      case CustomBtnType.big:
        return GestureDetector(
          onTap: isEnable ? onTap : null,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Container(
              height: 52,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: isEnable ? bgColor : unableBgColor),
              child: Text(
                txt,
                style: KwangStyle.btn1B.copyWith(
                  color: isEnable ? txtColor : unableTxtColor,
                ),
              ),
            ),
          ),
        );
      default:
        return GestureDetector(
          onTap: isEnable ? onTap : null,
          child: Container(
            height: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: isEnable ? bgColor : unableBgColor),
            child: Text(
              txt,
              style: KwangStyle.btn2B.copyWith(
                color: isEnable ? txtColor : unableTxtColor,
              ),
            ),
          ),
        );
    }
  }
}
