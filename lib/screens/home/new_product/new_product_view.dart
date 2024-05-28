import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:immersion_kwangsang/screens/home/home_view_model.dart';
import 'package:immersion_kwangsang/screens/home/new_product/widgets/sale_store_card.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/widgets/card_h_spliter.dart';

class NewProductView extends StatelessWidget {
  const NewProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        key: const PageStorageKey(EHomeTab.newProduct),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 12,
                    ),
                    child: Text(
                      '곧 마감세일이 시작됩니다',
                      style: KwangStyle.header2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    height: 44,
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    decoration: BoxDecoration(
                      color: KwangColor.primary300,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Text(
                          '오후 8:30 ~ 9:00 시작 매장',
                          style: KwangStyle.btn2SB.copyWith(
                            color: KwangColor.grey100,
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 14,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          color: KwangColor.primary200,
                        ),
                        Text(
                          '3곳',
                          style: KwangStyle.btn2SB.copyWith(
                            color: KwangColor.primary100,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            sliver: SliverList.separated(
              itemBuilder: (context, index) => const SaleStoreCard(),
              separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 20,
                ),
                child: CardHSpliter(
                  size: 1,
                  color: KwangColor.grey350,
                ),
              ),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
