import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';

class CountAndSortTitle extends StatelessWidget {
  const CountAndSortTitle(
      {super.key,
      required this.title,
      required this.count,
      required this.sort,
      required this.onTap});

  final String title;
  final int count;
  final String sort;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: KwangStyle.header1,
            ),
            const SizedBox(width: 6),
            Text(
              '$count',
              style: const TextStyle(
                color: KwangColor.grey500,
                fontSize: 18,
                height: 24 / 18,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: onTap,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "가격순",
                style: KwangStyle.btn2SB.copyWith(color: KwangColor.grey600),
              ),
              const SizedBox(width: 4),
              SvgPicture.asset(
                "assets/icons/ic_18_order.svg",
                width: 18,
                height: 18,
                colorFilter:
                    const ColorFilter.mode(KwangColor.grey700, BlendMode.srcIn),
              )
            ],
          ),
        )
      ],
    );
  }
}
