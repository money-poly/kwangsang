import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immersion_kwangsang/models/menu.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/utils/extensions.dart';
import 'package:immersion_kwangsang/widgets/custom_network_image.dart';

class MenuRankCard extends StatelessWidget {
  final Menu menu;
  final int rank;

  const MenuRankCard({
    super.key,
    required this.menu,
    required this.rank,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(color: KwangColor.grey100),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: CustomNetworkImage(
                  imageUrl: menu.imgUrl,
                  width: 80,
                  height: 80,
                ),
              ),
              Container(
                width: 22,
                height: 20,
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: rank > 3 ? KwangColor.grey900 : KwangColor.red,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Center(
                  child: Text(
                    rank.toString(),
                    style: KwangStyle.btn3.copyWith(
                      color: KwangColor.grey100,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    menu.store ?? '',
                    style: KwangStyle.btn3.copyWith(
                      color: KwangColor.grey600,
                    ),
                  ),
                  Text(
                    menu.name,
                    style: KwangStyle.btn2B,
                  ),
                  const Expanded(child: SizedBox()),
                  Row(
                    children: [
                      Text(
                        '${menu.discountRate}%',
                        style: KwangStyle.btn2B.copyWith(
                          color: KwangColor.red,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          menu.discountPrice.price(),
                          style: KwangStyle.btn2B,
                        ),
                      ),
                      Text(
                        '원',
                        style: KwangStyle.btn2B,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/ic_24_view.svg',
                  height: 18,
                  colorFilter: const ColorFilter.mode(
                      KwangColor.grey800, BlendMode.srcIn),
                ),
                Text(
                  menu.view?.toString() ?? '',
                  style: KwangStyle.btn4.copyWith(
                    color: KwangColor.grey800,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
