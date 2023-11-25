import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/styles/color.dart';

class Tag {
  String icon;
  String name;
  Color txtColor;
  Color bgColor;

  Tag(
      {required this.name,
      required this.txtColor,
      required this.bgColor,
      this.icon = "time"});
}

Map<String, Tag> tagMapping = {
  '마감 할인': Tag(
      name: '마감 할인',
      txtColor: KwangColor.green,
      bgColor: KwangColor.grey300,
      icon: "time"),
};
