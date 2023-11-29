import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immersion_kwangsang/screens/search/search_main_view_model.dart';
import 'package:immersion_kwangsang/screens/search/widgets/keyword_rank_row.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:provider/provider.dart';

class SearchMainView extends StatelessWidget {
  const SearchMainView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SearchMainViewModel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          "검색",
          style: KwangStyle.header2,
        ),
        titleSpacing: 0,
        toolbarHeight: 52,
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: SvgPicture.asset(
            "assets/icons/ic_36_back.svg",
            width: 36,
            height: 36,
          ),
        ),
        leadingWidth: 52,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(20, 8, 20, 20),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: KwangColor.grey300,
                borderRadius: BorderRadius.circular(4)),
            child: TextField(
              controller: viewModel.searchController,
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
                          },
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
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Row(
              children: [
                Text(
                  "광생러 ",
                  style:
                      KwangStyle.header2.copyWith(color: KwangColor.primary400),
                ),
                Text(
                  "추천 키워드",
                  style: KwangStyle.header2,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Wrap(
                    direction: Axis.vertical,
                    spacing: 14,
                    children: viewModel.keywords
                        .where((e) => viewModel.keywords.indexOf(e) < 5)
                        .map((e) => GestureDetector(
                              onTap: () {
                                viewModel.searchController.text = e;
                              },
                              child: KeywordRankRow(
                                  rank: viewModel.keywords.indexOf(e) + 1,
                                  keyword: e,
                                  rankColor: viewModel.keywords.indexOf(e) < 3
                                      ? KwangColor.primary400
                                      : KwangColor.grey900),
                            ))
                        .toList(),
                  ),
                ),
                Expanded(
                  child: Wrap(
                      direction: Axis.vertical,
                      spacing: 14,
                      children: viewModel.keywords
                          .where((e) => viewModel.keywords.indexOf(e) >= 5)
                          .map((e) => GestureDetector(
                                onTap: () {
                                  viewModel.searchController.text = e;
                                },
                                child: KeywordRankRow(
                                    rank: viewModel.keywords.indexOf(e) + 1,
                                    keyword: e,
                                    rankColor: KwangColor.grey900),
                              ))
                          .toList()),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
