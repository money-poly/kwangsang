import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/styles/color.dart';

class CarouselIndicator extends StatelessWidget {
  const CarouselIndicator(
      {super.key,
      required this.controller,
      required this.currIdx,
      required this.length});

  final CarouselController controller;
  final int currIdx;
  final int length;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (index) => Row(
          children: [
            GestureDetector(
              onTap: () {
                controller.animateToPage(index);
              },
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currIdx == index ? KwangColor.grey500 : KwangColor.grey400,
                ),
              ),
            ),
            if (index != length - 1) const SizedBox(width: 8)
          ],
        ),
      ),
    );
  }
}
