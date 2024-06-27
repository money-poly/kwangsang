import 'package:flutter/material.dart';

/// Example
/// "#AABBCC" to 0xFFAABBCC
Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

/// Example
/// 0xFFAABBCC to "#AABBCC"
String colorToHex(Color color) {
  return '#${color.value.toRadixString(16)}';
}
