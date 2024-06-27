import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immersion_kwangsang/models/menu/menu_model.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';

class MenuStatusWidget extends StatelessWidget {
  const MenuStatusWidget(
      {super.key, required this.status, this.isSelectable = true});

  final MenuStatus status;
  final bool isSelectable;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      direction: Axis.horizontal,
      spacing: 4,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
          decoration: BoxDecoration(
            color: status.color,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            status.str,
            style: KwangStyle.body3M.copyWith(color: KwangColor.grey100),
          ),
        ),
        if (isSelectable)
          SvgPicture.asset(
            "assets/icons/ic_16_dropdown.svg",
            width: 16,
            height: 16,
            colorFilter:
                const ColorFilter.mode(KwangColor.grey600, BlendMode.srcIn),
          ),
      ],
    );
  }
}
