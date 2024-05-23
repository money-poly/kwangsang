import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/screens/home/home_view_model.dart';
import 'package:immersion_kwangsang/screens/home/limit_stock/widgets/last_products_card.dart';
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
            title: Row(
              children: [
                const RoundedSelectableButton(
                  text: '전체',
                  isSelected: true,
                ),
                RoundedSelectableButton(
                  text: '한식',
                  onTap: () {
                    print('한식');
                  },
                ),
                const RoundedSelectableButton(text: '중식'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
