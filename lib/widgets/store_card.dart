import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/models/store/store_home_model.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/widgets/store_img_card.dart';
import 'package:intl/intl.dart';

class StoreCard extends StatelessWidget {
  const StoreCard({super.key, required this.store});

  final StoreHome store;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                store.category!,
                style: KwangStyle.btn2SB.copyWith(
                  color: KwangColor.primary400,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Container(
                    width: 6,
                    height: 24,
                    color: KwangColor.primary400,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    store.name,
                    style: KwangStyle.header2,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    store.menu.name,
                    style: KwangStyle.body1M.copyWith(
                      color: KwangColor.grey600,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "${store.menu.regularPrice}원",
                    style: KwangStyle.body1M.copyWith(
                      color: KwangColor.grey600,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "${store.menu.discountRate}%",
                    style: KwangStyle.btn1B.copyWith(color: KwangColor.red),
                  ),
                  const SizedBox(width: 8),
                  Text(
                      "${NumberFormat('###,###,###,###').format(store.menu.discountPrice).replaceAll(' ', ',')}원",
                      style: KwangStyle.btn1B)
                ],
              )
            ],
          ),
          ImgCard(
            imgUrl: store.menu.imgUrl,
            type: ImgCardType.menu,
          ),
        ],
      ),
    );
  }
}
