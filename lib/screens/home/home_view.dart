import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immersion_kwangsang/screens/home/best_product/best_product_view.dart';
import 'package:immersion_kwangsang/screens/home/home_view_model.dart';
import 'package:immersion_kwangsang/screens/home/limit_stock/limit_stock_view.dart';
import 'package:immersion_kwangsang/screens/home/new_product/new_product_view.dart';
import 'package:immersion_kwangsang/screens/home/recommend/recommend_view.dart';
import 'package:immersion_kwangsang/screens/search/search_main_view.dart';
import 'package:immersion_kwangsang/screens/search/search_main_view_model.dart';
import 'package:immersion_kwangsang/services/amplitude.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);
    final analytics = AnalyticsConfig();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KwangColor.grey100,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      '월계동',
                      style: KwangStyle.header2,
                      maxLines: 1,
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: KwangColor.grey900,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () async {
                analytics.changePage("홈", "검색");
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ChangeNotifierProvider(
                      create: (_) => SearchMainViewModel(),
                      child: const SearchMainView(),
                    ),
                  ),
                );
                analytics.changePage("검색", "홈");
              },
              child: SvgPicture.asset(
                "assets/icons/ic_36_search.svg",
                width: 36,
                height: 36,
              ),
            ),
          ],
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: Column(
        children: [
          TabBar(
            controller: viewModel.tabController,
            // padding: const EdgeInsets.symmetric(horizontal: 20),
            tabs: viewModel.tabs,
            isScrollable: false,
            labelStyle: KwangStyle.btn2B,
            labelColor: KwangColor.primary400,
            unselectedLabelStyle: KwangStyle.btn2SB,
            unselectedLabelColor: KwangColor.grey500,
            indicator: const UnderlineTabIndicator(
              insets: EdgeInsets.symmetric(horizontal: -8),
              borderSide: BorderSide(
                width: 3,
                color: KwangColor.primary400,
              ),
            ),
          ),
          const Divider(
            height: 1,
            color: KwangColor.grey350,
          ),
          Expanded(
            child: TabBarView(
              controller: viewModel.tabController,
              children: const [
                RecommendView(),
                LimitStockView(),
                NewProductView(),
                BestProductView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
