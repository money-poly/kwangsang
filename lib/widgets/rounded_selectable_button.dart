import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';

class RoundedSelectableButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function()? onTap;

  const RoundedSelectableButton({
    super.key,
    required this.text,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 38,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? KwangColor.primary400 : KwangColor.grey100,
          border: Border.all(
            width: 1,
            color: isSelected ? KwangColor.primary400 : KwangColor.grey500,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
          child: Text(
            text,
            style: KwangStyle.btn2B.copyWith(
              color: isSelected ? KwangColor.grey100 : KwangColor.grey700,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
