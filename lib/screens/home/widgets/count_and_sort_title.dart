import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immersion_kwangsang/screens/home/home_view_model.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';

class CountAndSortTitle extends StatelessWidget {
  const CountAndSortTitle(
      {super.key,
      required this.title,
      required this.count,
      required this.sort,
      required this.onTap,
      this.sortOn = false});

  final String title;
  final int count;
  final Order sort;
  final Function() onTap;
  final bool sortOn;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          sortOn ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
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
        if (sortOn)
          TitleSortBtn(
            sort: sort,
            onTap: onTap,
          )
      ],
    );
  }
}

class TitleSortBtn extends StatelessWidget {
  const TitleSortBtn({
    super.key,
    required this.sort,
    required this.onTap,
  });

  final Order sort;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            sort.str,
            style: KwangStyle.btn2SB.copyWith(color: KwangColor.grey700),
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
    );
  }
}
