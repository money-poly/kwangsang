import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:immersion_kwangsang/providers/position_provider.dart';
import 'package:immersion_kwangsang/screens/menu/menu_view.dart';
import 'package:immersion_kwangsang/screens/menu/menu_view_model.dart';
import 'package:immersion_kwangsang/screens/search/search_main_view_model.dart';
import 'package:immersion_kwangsang/services/amplitude.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/widgets/empty_card.dart';
import 'package:immersion_kwangsang/widgets/menu_card.dart';
import 'package:provider/provider.dart';

class SearchAfterTab extends StatelessWidget {
  const SearchAfterTab({super.key});

  @override
  Widget build(BuildContext context) {
    final positionProvider = Provider.of<PositionProvider>(context);
    final viewModel = Provider.of<SearchMainViewModel>(context);
    final analytics = AnalyticsConfig();
    return viewModel.menus == null
        ? const Center(
            child: CircularProgressIndicator(
            color: KwangColor.primary400,
          ))
        : Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: KwangColor.grey300,
                    borderRadius: BorderRadius.circular(4)),
                child: TextField(
                  controller: viewModel.searchController,
                  onSubmitted: (value) {
                    if (value.length < 2) {
                      showToast("2글자 이상으로 입력해주세요");
                    } else {
                      viewModel.search(
                          value,
                          LatLng(positionProvider.myPosition!.latitude,
                              positionProvider.myPosition!.longitude));
                    }
                  },
                  style: KwangStyle.body1M,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 2),
                      hintText: "컵라면, 샐러드, 돈까스 등",
                      hintStyle:
                          KwangStyle.body1M.copyWith(color: KwangColor.grey500),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: SvgPicture.asset(
                          "assets/icons/ic_24_search.svg",
                          width: 24,
                          height: 24,
                          colorFilter: const ColorFilter.mode(
                              KwangColor.grey500, BlendMode.srcIn),
                        ),
                      ),
                      prefixIconConstraints:
                          const BoxConstraints(minWidth: 24, minHeight: 24),
                      suffixIcon: viewModel.keywordsIsEmpty
                          ? null
                          : GestureDetector(
                              onTap: () {
                                viewModel.searchController.clear();
                                viewModel.changeStatus(SearchStatus.before);
                              },
                              behavior: HitTestBehavior.translucent,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: SvgPicture.asset(
                                  "assets/icons/ic_24_remove_circle.svg",
                                  width: 24,
                                  height: 24,
                                  colorFilter: const ColorFilter.mode(
                                      KwangColor.grey500, BlendMode.srcIn),
                                ),
                              ),
                            ),
                      suffixIconConstraints: viewModel.keywordsIsEmpty
                          ? null
                          : const BoxConstraints(minWidth: 24, minHeight: 24)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "검색결과",
                      style: KwangStyle.header2,
                    ),
                    // if (viewModel.menus!.isNotEmpty)
                    //   SvgPicture.asset(
                    //     "assets/icons/ic_24_filter.svg",
                    //     width: 24,
                    //     height: 24,
                    //   ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              viewModel.menus!.isEmpty
                  ? const EmptyCard(emptyType: EmptyCardType.search)
                  : Expanded(
                      child: GridView(
                        padding: const EdgeInsets.fromLTRB(20, 8, 20, 65),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 28,
                            crossAxisSpacing: 20,
                            childAspectRatio:
                                (MediaQuery.of(context).size.width - 60) /
                                    2 /
                                    196),
                        children: viewModel.menus!
                            .map((e) => GestureDetector(
                                onTap: () async {
                                  analytics.changePage("검색", "메뉴상세");
                                  await Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ChangeNotifierProvider(
                                        create: (_) => MenuViewModel(
                                            context,
                                            LatLng(
                                                positionProvider
                                                    .myPosition!.latitude,
                                                positionProvider
                                                    .myPosition!.longitude),
                                            e.id),
                                        child: MenuView(menuId: e.id),
                                      ),
                                    ),
                                  );
                                },
                                child: MenuCard(
                                    menu: e, type: MenuCardType.vertical)))
                            .toList(),
                      ),
                    )
            ],
          );
  }
}
