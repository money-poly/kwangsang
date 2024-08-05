import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immersion_kwangsang/models/menu/menu_model.dart';
import 'package:immersion_kwangsang/models/menu/menu_new_product_model.dart';
import 'package:immersion_kwangsang/screens/home/new_product/widgets/sale_countdown.dart';
import 'package:immersion_kwangsang/screens/home/widgets/item_card.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/utils/extensions.dart';
import 'package:immersion_kwangsang/widgets/custom_network_image.dart';

class SaleStoreCard extends StatelessWidget {
  final DateTime saleTime;
  final MenuNewProductStoreItemModel storeItem;

  const SaleStoreCard({
    super.key,
    required this.saleTime,
    required this.storeItem,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: const CustomNetworkImage(
                  width: 36,
                  height: 36,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            storeItem.store.name,
                            style: KwangStyle.body2M.copyWith(
                              color: KwangColor.grey800,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.keyboard_arrow_right_rounded,
                          size: 18,
                          color: KwangColor.grey700,
                        ),
                      ],
                    ),
                    Text(
                      '${saleTime.toKoHHMM()} 세일 시작',
                      style: KwangStyle.body2M.copyWith(
                        color: KwangColor.grey700,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/ic_20_alarm.svg",
                    colorFilter: const ColorFilter.mode(
                      KwangColor.red,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 6),
                  SaleCountDown(saleTime: saleTime),
                  const SizedBox(width: 8),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              for (var (idx, menu) in storeItem.menus.indexed)
                Padding(
                  padding: EdgeInsets.only(right: idx < 2 ? 2 : 0),
                  child: ItemCard(
                    type: ItemCardType.miniSoon,
                    menu: Menu(
                      id: menu.id,
                      name: menu.name,
                      imgUrl: menu.imgUrl,
                      discountRate: menu.discountRate,
                      discountPrice: menu.discountPrice,
                      regularPrice: menu.regularPrice,
                      count: menu.count,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
