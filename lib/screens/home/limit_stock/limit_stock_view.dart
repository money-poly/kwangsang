import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/screens/home/limit_stock/limit_stock_view_model.dart';
import 'package:immersion_kwangsang/screens/home/limit_stock/widgets/last_products_card.dart';
import 'package:immersion_kwangsang/screens/home/limit_stock/widgets/sliver_limit_stock_appbar.dart';
import 'package:immersion_kwangsang/screens/home/limit_stock/widgets/sliver_limit_stock_listview.dart';
import 'package:immersion_kwangsang/screens/home/limit_stock/widgets/sliver_limit_stock_state.dart';
import 'package:immersion_kwangsang/widgets/card_h_spliter.dart';
import 'package:provider/provider.dart';

class LimitStockView extends StatefulWidget {
  const LimitStockView({super.key});

  @override
  State<LimitStockView> createState() => _LimitStockViewState();
}

class _LimitStockViewState extends State<LimitStockView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: CustomScrollView(
        controller: context.read<LimitStockViewModel>().scrollController,
        slivers: const [
          SliverToBoxAdapter(
            child: LastProductsCard(),
          ),
          SliverToBoxAdapter(
            child: CardHSpliter(),
          ),
          SliverLimitStockAppBar(),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            sliver: SliverLimitStockListView(),
          ),
          SliverLimitStockState(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
