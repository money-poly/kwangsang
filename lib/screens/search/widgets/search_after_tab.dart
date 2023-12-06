import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immersion_kwangsang/screens/search/search_main_view_model.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/widgets/menu_card.dart';
import 'package:provider/provider.dart';

class SearchAfterTab extends StatelessWidget {
  const SearchAfterTab({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SearchMainViewModel>(context);
    return viewModel.menus == null
        ? const Center(child: CircularProgressIndicator())
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
                    viewModel.search(value);
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
                  ? Expanded(
                      child: Column(children: [
                        Flexible(
                          flex: 1,
                          child: Container(),
                        ),
                        Image.asset(
                          "assets/imgs/img_86_bird_exclamation.png",
                          width: 86,
                          height: 86,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Column(children: [
                            Text(
                              "검색결과가 없어요!",
                              style: KwangStyle.header2,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "다른 검색어로 다시 검색해주세요",
                              style: KwangStyle.btn1SB
                                  .copyWith(color: KwangColor.grey600),
                            ),
                          ]),
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(),
                        )
                      ]),
                    )
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
                            .map((e) =>
                                MenuCard(menu: e, type: MenuCardType.vertical))
                            .toList(),
                      ),
                    )
            ],
          );
  }
}
