import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immersion_kwangsang/models/menu/menu_model.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';

class ItemRankingRow extends StatelessWidget {
  const ItemRankingRow({super.key, required this.rank, required this.menu});

  final int rank;
  final Menu menu;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: KwangColor.lightRed,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  "인기",
                  style: KwangStyle.btn3SB.copyWith(color: KwangColor.red),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('$rank',
                        style: KwangStyle.body2
                            .copyWith(color: KwangColor.grey800)),
                    const SizedBox(width: 8),
                    Text(menu.name, style: KwangStyle.body1M),
                  ],
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
          ),
        ),
      ],
    );
  }
}
