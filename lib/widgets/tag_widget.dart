import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immersion_kwangsang/models/tag/tag_model.dart';
import 'package:immersion_kwangsang/styles/txt.dart';

class TagWidget extends StatelessWidget {
  const TagWidget({super.key, required this.tag});

  final Tag tag;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(6, 2, 8, 2),
      decoration: BoxDecoration(
        color: tag.bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Wrap(
        direction: Axis.horizontal,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 4,
        children: [
          SvgPicture.asset(
            "assets/icons/ic_24_${tag.icon}.svg",
            width: 12,
            height: 12,
            colorFilter: ColorFilter.mode(tag.txtColor, BlendMode.srcIn),
          ),
          Text(
            tag.name,
            style: KwangStyle.body2M.copyWith(color: tag.txtColor),
          )
        ],
      ),
    );
  }
}
