import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';

class TextFieldTitle extends StatelessWidget {
  const TextFieldTitle(
      {super.key, required this.title, this.isNecessary = false});

  final String title;
  final bool isNecessary;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(title, style: KwangStyle.header3),
          if (isNecessary)
            Text(
              "*",
              style: KwangStyle.header3.copyWith(color: KwangColor.red),
            )
        ],
      ),
    );
  }
}
