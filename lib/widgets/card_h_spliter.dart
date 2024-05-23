import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/styles/color.dart';

class CardHSpliter extends StatelessWidget {
  final double size;

  const CardHSpliter({
    super.key,
    this.size = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: size,
      color: KwangColor.grey200,
    );
  }
}
