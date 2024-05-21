import 'package:flutter/material.dart';

import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/utils/count_to_color.dart';
import 'package:immersion_kwangsang/widgets/count_tag_widget.dart';

class SoldoutChartWidget extends StatelessWidget {
  const SoldoutChartWidget({super.key, required this.count});

  final int count;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 8,
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: KwangColor.grey300,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        Positioned(
          top: 5,
          left: 0,
          child: Container(
            height: 8,
            width: ((MediaQuery.of(context).size.width - 116) / 10) *
                (count > 10 ? 10 : count),
            decoration: BoxDecoration(
              color: countToColor(count, CountColorType.txt),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: CountTagWidget(count: count),
        )
      ],
    );
  }
}
