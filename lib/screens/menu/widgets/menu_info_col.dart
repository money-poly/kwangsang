import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';

class MenuInfoCol extends StatelessWidget {
  const MenuInfoCol({super.key, required this.title, required this.content});

  final String title;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: KwangStyle.btn2SB.copyWith(color: KwangColor.grey700),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          content,
          style: KwangStyle.btn1SB,
        ),
      ],
    );
  }
}
