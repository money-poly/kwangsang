import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immersion_kwangsang/models/menu/menu_model.dart';
import 'package:immersion_kwangsang/screens/home/home_view_model.dart';
import 'package:immersion_kwangsang/screens/home/limit_stock/widgets/last_products_card.dart';
import 'package:immersion_kwangsang/screens/home/widgets/item_card.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/widgets/card_h_spliter.dart';
import 'package:immersion_kwangsang/widgets/rounded_selectable_button.dart';

class LimitStockView extends StatelessWidget {
  const LimitStockView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        key: const PageStorageKey(EHomeTab.limitStock),
        slivers: [
          const SliverToBoxAdapter(
            child: LastProductsCard(),
          ),
          const SliverToBoxAdapter(
            child: CardHSpliter(),
          ),
          SliverAppBar(
            pinned: true,
            backgroundColor: KwangColor.grey100,
            surfaceTintColor: Colors.transparent,
            titleSpacing: 0,
            toolbarHeight: 102,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 8),
                Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: Row(
                      children: [
                        Text(
                          '곧 품절이에요',
                          style: KwangStyle.header2,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            '36',
                            style: KwangStyle.header2.copyWith(
                              color: KwangColor.grey500,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              Text(
                                Order.name.str,
                                style: KwangStyle.btn2,
                              ),
                              const SizedBox(width: 4),
                              SvgPicture.asset(
                                "assets/icons/ic_18_order.svg",
                                colorFilter: const ColorFilter.mode(
                                  KwangColor.grey700,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 54,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => RoundedSelectableButton(
                      text: ECategory.values[index].title,
                      isSelected: ECategory.values[index] == ECategory.all,
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                    itemCount: ECategory.values.length,
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            sliver: SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 26,
                crossAxisSpacing: 4,
                childAspectRatio:
                    ((MediaQuery.sizeOf(context).width - 44) / 2) /
                        (((MediaQuery.sizeOf(context).width - 44) / 2) + 90),
              ),
              itemBuilder: (context, index) => ItemCard(
                type: ItemCardType.vertical,
                menu: Menu(
                  id: 1,
                  name: "고구마 휘낭시에",
                  imgUrl:
                      "https://image.idus.com/image/files/8a8f31577e754c079c372824a103b2a9_512.jpg",
                  discountRate: 50,
                  discountPrice: 1000,
                ),
              ),
              itemCount: 36,
            ),
          ),
        ],
      ),
    );
  }
}
