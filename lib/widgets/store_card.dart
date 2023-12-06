import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/models/store.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';

class StoreCard extends StatelessWidget {
  const StoreCard({super.key, required this.store});

  final Store store;
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
                    store.maxDiscountMenu.name!,
                    style: KwangStyle.body1M.copyWith(
                      color: KwangColor.grey600,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "${store.maxDiscountMenu.originPrice}원",
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
                    "${store.maxDiscountMenu.discountRate}%",
                    style: KwangStyle.btn1B.copyWith(color: KwangColor.red),
                  ),
                  const SizedBox(width: 8),
                  Text("8,000원", style: KwangStyle.btn1B)
                ],
              )
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: ExtendedImage.network(
              store
                  .imgUrl,
              width: 96,
              height: 96,
              fit: BoxFit.cover,
              cache: true,
            ),
          )
        ],
      ),
    );
  }
}
