import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';

enum CountWidgetSize { small, large }

class CountWidget extends StatelessWidget {
  const CountWidget(
      {super.key,
      required this.count,
      required this.add,
      required this.subtract,
      this.bgColor = KwangColor.grey300,
      this.size = CountWidgetSize.small});

  final int count;
  final Function() add;
  final Function() subtract;
  final Color bgColor;
  final CountWidgetSize size;

  @override
  Widget build(BuildContext context) {
    int maxCount = 999;
    int minCount = 0;
    return Container(
      width: size == CountWidgetSize.small ? 85 : 122,
      height: size == CountWidgetSize.small ? 36 : 52,
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
                width: size == CountWidgetSize.small ? 20 : 28,
                height: size == CountWidgetSize.small ? 20 : 28),
          ),
          Text(
            count.toString(),
            style: (size == CountWidgetSize.small
                    ? KwangStyle.body1M
                    : KwangStyle.btn1B)
                .copyWith(
              color:
                  count == minCount ? KwangColor.grey500 : KwangColor.grey800,
            ),
          ),
          GestureDetector(
            onTap: add,
            child: SvgPicture.asset(
                "assets/icons/ic_20_add_${count == maxCount ? "unable" : "enable"}.svg",
                width: size == CountWidgetSize.small ? 20 : 28,
                height: size == CountWidgetSize.small ? 20 : 28),
          ),
        ],
      ),
    );
  }
}
