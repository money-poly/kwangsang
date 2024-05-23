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

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late final HomeViewModel _viewModel;
  late final AnalyticsConfig _analytics;

  late final TabController _tabController;

  @override
  void initState() {
    _analytics = AnalyticsConfig();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _viewModel = Provider.of<HomeViewModel>(context);

    _tabController = TabController(
      length: _viewModel.tabs.length,
      vsync: this,
    );
    _viewModel.initTabController(
      tabController: _tabController,
    );
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    // TODO: _analytics.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                _analytics.changePage("홈", "검색");
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ChangeNotifierProvider(
                      create: (_) => SearchMainViewModel(),
                      child: const SearchMainView(),
                    ),
                  ),
                );
                _analytics.changePage("검색", "홈");
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
            controller: _viewModel.tabController,
            tabs: _viewModel.tabs,
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
            dividerHeight: 0,
          ),
          const Divider(
            height: 1,
            color: KwangColor.grey350,
          ),
          Expanded(
            child: TabBarView(
              controller: _viewModel.tabController,
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
