import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immersion_kwangsang/models/store.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/widgets/store_img_card.dart';
import 'package:immersion_kwangsang/widgets/tag_widget.dart';

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
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 4,
                      children: [
                        SvgPicture.asset("assets/icons/ic_24_percent.svg",
                            colorFilter: const ColorFilter.mode(
                                KwangColor.red, BlendMode.srcIn)),
                        Text(
                          "최대 ${store.maxDiscountMenu.discountRate}%",
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
                    if (store.description != null) const SizedBox(height: 6),
                    if (store.description != null)
                      Text(
                        store.description!,
                        style: KwangStyle.body1M
                            .copyWith(color: KwangColor.grey700),
                        overflow: TextOverflow.ellipsis,
                      )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Wrap(
                    direction: Axis.horizontal,
                    children: (store.tags ?? [])
                        .map((e) => TagWidget(tag: e))
                        .toList(),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 12),
          ImgCard(imgUrl: store.imgUrl, type: ImgCardType.store)
        ],
      ),
    );
  }
}
