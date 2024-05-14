import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';

enum CountColorType { background, txt }

class CountTagWidget extends StatelessWidget {
  const CountTagWidget({super.key, required this.count});

  final int count;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
          color: countToColor(CountColorType.background),
          borderRadius: BorderRadius.circular(12)),
      child: Text(
        "$count개 남음",
        style: KwangStyle.btn4.copyWith(
          color: countToColor(CountColorType.txt),
        ),
      ),
    );
  }

  Color countToColor(CountColorType type) {
    final List<int> datums = [4, 7];

    switch (type) {
      case CountColorType.background:
        if (count < datums[0]) {
          return KwangColor.lightRed;
        } else if (count < datums[1]) {
          return KwangColor.lightOrange;
        } else {
          return KwangColor.lightGreen;
        }
      case CountColorType.txt:
        if (count < datums[0]) {
          return KwangColor.red;
        } else if (count < datums[1]) {
          return KwangColor.orange;
        } else {
          return KwangColor.green;
        }
      default:
        return Colors.black;
    }
  }
}
