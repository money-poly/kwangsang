import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/models/menu/menu_model.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/utils/number_formatter.dart';
import 'package:immersion_kwangsang/utils/txt_size.dart';

class ItemDiscountWidget extends StatelessWidget {
  const ItemDiscountWidget({super.key, required this.menu});

  final Menu menu;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getDiscountCardWidth(menu),
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: KwangColor.primary400,
          boxShadow: [
            BoxShadow(
              color: KwangColor.black.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 0),
            ),
          ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 25,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: KwangColor.grey100),
                child: Text(
                  "${menu.discountRate}%",
                  style: KwangStyle.btn2B.copyWith(
                    color: KwangColor.red,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "SALE",
                  style: KwangStyle.btn1SB.copyWith(
                    color: KwangColor.grey100,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
          const SizedBox(height: 2),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 2,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: KwangColor.grey100,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  commaNumberFormatter(menu.regularPrice ?? 0),
                  style: KwangStyle.body2M.copyWith(
                    color: KwangColor.grey600,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: KwangColor.grey600,
                  ),
                ),
                const SizedBox(width: 12),
                SizedBox(
                  height: 22,
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        width: getTxtSize(
                                "${menu.discountPrice}원", KwangStyle.btn1SB)
                            .width,
                        height: 14,
                        color: const Color(0xFFFFF48E),
                      ),
                      Text("${menu.discountPrice}원", style: KwangStyle.btn1SB),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

double getDiscountCardWidth(Menu menu) {
  final txtWidth = 34 +
      getTxtSize("${menu.regularPrice ?? 0}원", KwangStyle.body2M).width +
      getTxtSize("${menu.discountPrice}원", KwangStyle.btn1SB).width;
  if (txtWidth > 135) {
    return txtWidth;
  } else {
    return 135;
  }
}
