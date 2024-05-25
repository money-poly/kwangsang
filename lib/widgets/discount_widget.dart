import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';

class DiscountWidget extends StatelessWidget {
  const DiscountWidget(
      {super.key, required this.size, required this.discountRate});

  final double size;
  final int discountRate;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size * 0.05),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: KwangColor.red,
        boxShadow: [
          BoxShadow(
            color: KwangColor.black.withOpacity(0.25),
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      width: size,
      height: size,
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              discountRate.toString(),
              style: KwangStyle.btn2B.copyWith(
                color: KwangColor.grey100,
              ),
            ),
            Text(
              "%",
              style: KwangStyle.body3.copyWith(
                color: KwangColor.grey100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
