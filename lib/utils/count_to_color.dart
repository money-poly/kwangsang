import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/widgets/count_tag_widget.dart';

Color countToColor(int count, CountColorType type) {
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
