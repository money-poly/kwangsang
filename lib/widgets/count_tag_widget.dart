import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/utils/count_to_color.dart';

enum CountColorType { background, txt }

class CountTagWidget extends StatelessWidget {
  const CountTagWidget({super.key, required this.count});

  final int count;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
          color: countToColor(count, CountColorType.background),
          borderRadius: BorderRadius.circular(12)),
      child: Text(
        "$count개 남음",
        style: KwangStyle.btn4.copyWith(
          color: countToColor(count, CountColorType.txt),
        ),
      ),
    );
  }
}
