import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immersion_kwangsang/screens/home/home_view_model.dart';
import 'package:immersion_kwangsang/screens/home/widgets/home_bottom_sheet.dart';
import 'package:immersion_kwangsang/screens/search/search_main_view.dart';
import 'package:immersion_kwangsang/screens/search/search_main_view_model.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/widgets/empty_card.dart';
import 'package:immersion_kwangsang/widgets/menu_card.dart';
import 'package:immersion_kwangsang/widgets/store_card.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            "assets/imgs/img_104_logo_appbar.png",
            width: 104,
            height: 46,
          ),
          toolbarHeight: 64,
          titleSpacing: 20,
          centerTitle: false,
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider(
                      create: (_) => SearchMainViewModel(),
                      child: const SearchMainView(),
                    ),
                  ),
                );
              },
              child: SvgPicture.asset(
                "assets/icons/ic_36_search.svg",
                width: 36,
                height: 36,
              ),
            ),
            const SizedBox(width: 20)
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: viewModel.isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: KwangColor.primary400,
                ),
              )
            : DefaultTabController(
                initialIndex: 0,
                length: viewModel.tabs!.length,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TabBar(
                      tabs: viewModel.tabs!,
                      isScrollable: true,
                      indicatorWeight: 3,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelStyle: KwangStyle.btn2B,
                      labelColor: KwangColor.primary400,
                      unselectedLabelStyle: KwangStyle.btn2SB,
                      unselectedLabelColor: KwangColor.grey900,
                      indicatorColor: KwangColor.primary400,
                      indicatorPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: List.generate(
                          viewModel.tabs!.length,
                          (index) => viewModel.maxDiscountStores[index] ==
                                      null ||
                                  viewModel.discountMenus.isEmpty
                              ? const Column(
                                  children: [
                                    EmptyCard(emptyType: EmptyCardType.home)
                                  ],
                                )
                              : SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 64),
                                    child: Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 16),
                                          height: 100,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          color: Colors.orange,
                                          child: Text("배너"),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "할인율 가장 높아요",
                                                style: KwangStyle.header1,
                                              ),
                                              const SizedBox(width: 8),
                                              SvgPicture.asset(
                                                "assets/icons/ic_24_check_fill.svg",
                                                colorFilter:
                                                    const ColorFilter.mode(
                                                        KwangColor.primary300,
                                                        BlendMode.srcIn),
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: StoreCard(
                                            store: viewModel
                                                .maxDiscountStores[index]!,
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "지금 먹으면 할인",
                                                    style: KwangStyle.header1,
                                                  ),
                                                  const SizedBox(width: 8),
                                                  SvgPicture.asset(
                                                    "assets/icons/ic_24_percent.svg",
                                                    colorFilter:
                                                        const ColorFilter.mode(
                                                            KwangColor.red,
                                                            BlendMode.srcIn),
                                                  )
                                                ],
                                              ),
                                              GestureDetector(
                                                behavior:
                                                    HitTestBehavior.translucent,
                                                onTap: () {
                                                  showModalBottomSheet(
                                                    context: context,
                                                    builder: (context) =>
                                                        HomeBottomSheet(
                                                            viewModel:
                                                                viewModel),
                                                  );
                                                },
                                                child: Row(
                                                  children: [
                                                    Text(viewModel.order.str,
                                                        style: KwangStyle.body2M
                                                            .copyWith(
                                                                color: KwangColor
                                                                    .grey700)),
                                                    const SizedBox(
                                                      width: 4,
                                                    ),
                                                    SvgPicture.asset(
                                                      "assets/icons/ic_18_order.svg",
                                                      width: 18,
                                                      height: 18,
                                                      colorFilter:
                                                          const ColorFilter
                                                                  .mode(
                                                              KwangColor
                                                                  .grey700,
                                                              BlendMode.srcIn),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        GridView(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 12, 20, 20),
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  mainAxisSpacing: 28,
                                                  crossAxisSpacing: 20,
                                                  childAspectRatio:
                                                      (MediaQuery.of(context)
                                                                  .size
                                                                  .width -
                                                              60) /
                                                          2 /
                                                          196),
                                          children: viewModel
                                              .discountMenus[index]
                                              .map((e) => MenuCard(
                                                  menu: e,
                                                  type: MenuCardType.vertical))
                                              .toList(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    )
                  ],
                ),
              ));
  }
}