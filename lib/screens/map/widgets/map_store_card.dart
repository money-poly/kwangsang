import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immersion_kwangsang/models/store.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';

class MapStoreCard extends StatelessWidget {
  const MapStoreCard({super.key, required this.store});
  final Store store;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: KwangColor.grey100,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.2),
            blurRadius: 4,
            offset: Offset(0, 0),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width - 188,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      direction: Axis.horizontal,
                      spacing: 4,
                      children: [
                        SvgPicture.asset("assets/icons/ic_24_percent.svg",
                            colorFilter: const ColorFilter.mode(
                                KwangColor.red, BlendMode.srcIn)),
                        Text(
                          "최대 ${store.maxDiscountRate}%",
                          style:
                              KwangStyle.btn2SB.copyWith(color: KwangColor.red),
                        )
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      store.name,
                      style: KwangStyle.header2,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      store.description,
                      style:
                          KwangStyle.body1M.copyWith(color: KwangColor.grey700),
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Wrap(
                    direction: Axis.horizontal,
                    children: store.tags
                        .map((e) => Container(
                              padding: const EdgeInsets.fromLTRB(6, 2, 8, 2),
                              decoration: BoxDecoration(
                                color: e.bgColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Wrap(
                                direction: Axis.horizontal,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 4,
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/ic_24_${e.icon}.svg",
                                    width: 12,
                                    height: 12,
                                    colorFilter: ColorFilter.mode(
                                        e.txtColor, BlendMode.srcIn),
                                  ),
                                  Text(
                                    e.name,
                                    style: KwangStyle.body2M
                                        .copyWith(color: e.txtColor),
                                  )
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 96,
            height: 96,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: ExtendedImage.network(
                store.imgUrl,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
