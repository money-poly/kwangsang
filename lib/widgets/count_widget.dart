import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';

class CountWidget extends StatelessWidget {
  const CountWidget(
      {super.key,
      required this.count,
      required this.add,
      required this.subtract,
      this.bgColor = KwangColor.grey300});

  final int count;
  final Function() add;
  final Function() subtract;
  final Color bgColor;
  @override
  Widget build(BuildContext context) {
    int maxCount = 999;
    int minCount = 0;
    return Container(
      width: 85,
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: bgColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: subtract,
            child: SvgPicture.asset(
                "assets/icons/ic_20_subtract_${count == minCount ? "unable" : "enable"}.svg",
                width: 20,
                height: 20),
          ),
          Text(
            count.toString(),
            style: KwangStyle.body1M.copyWith(
              color:
                  count == minCount ? KwangColor.grey500 : KwangColor.grey800,
            ),
          ),
          GestureDetector(
            onTap: subtract,
            child: SvgPicture.asset(
                "assets/icons/ic_20_add_${count == maxCount ? "unable" : "enable"}.svg",
                width: 20,
                height: 20),
          ),
        ],
      ),
    );
  }
}
