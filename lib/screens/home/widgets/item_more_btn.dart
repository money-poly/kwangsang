import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';

class ItemMoreBtn extends StatelessWidget {
  const ItemMoreBtn({super.key, required this.onTap});

  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: 103,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: KwangColor.grey400),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 2),
                child: Text(
                  "상품 더 보기",
                  style: KwangStyle.btn3SB.copyWith(color: KwangColor.grey600),
                ),
              ),
              SvgPicture.asset(
                "assets/icons/ic_18_arrow_down.svg",
                width: 18,
                height: 18,
                colorFilter: const ColorFilter.mode(
                  KwangColor.grey600,
                  BlendMode.srcIn,
                ),
              ),
            ],
          )),
    );
  }
}
