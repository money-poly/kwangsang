import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/utils/string_color_serializer.dart';

part 'tag_model.freezed.dart';
part 'tag_model.g.dart';

@freezed
class Tag with _$Tag {
  factory Tag({
    @Default('time') String icon,
    required String name,
    @JsonKey(
      fromJson: hexToColor,
      toJson: colorToHex,
    )
    required Color txtColor,
    @JsonKey(
      fromJson: hexToColor,
      toJson: colorToHex,
    )
    required Color bgColor,
  }) = _Tag;

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
}

Map<String, Tag> tagMapping = {
  '마감할인': Tag(
    name: '마감할인',
    txtColor: KwangColor.green,
    bgColor: KwangColor.grey300,
    icon: "time",
  ),
};
