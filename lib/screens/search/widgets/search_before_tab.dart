import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immersion_kwangsang/screens/search/search_main_view_model.dart';
import 'package:immersion_kwangsang/screens/search/widgets/keyword_rank_row.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/widgets/custom_toast.dart';
import 'package:provider/provider.dart';

class SearchBeforeTab extends StatelessWidget {
  const SearchBeforeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SearchMainViewModel>(context);
    return Column(
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
                CustomToast.showToast("2글자 이상으로 입력해주세요");
              } else {
                viewModel.search(value);
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
        if (viewModel.history.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "최근 검색어",
                      style: KwangStyle.header2,
                    ),
                    GestureDetector(
                      onTap: () {
                        viewModel.clearHistory();
                      },
                      child: Text(
                        "전체삭제",
                        style: KwangStyle.body2M
                            .copyWith(color: KwangColor.grey500),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: viewModel.history.reversed
                        .map((e) => Container(
                              margin: const EdgeInsets.only(right: 16),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: KwangColor.grey300, width: 1),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Wrap(
                                direction: Axis.horizontal,
                                spacing: 8,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      viewModel.search(e);
                                    },
                                    child: Text(
                                      e,
                                      style: KwangStyle.body1M,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      viewModel.removeHistory(e);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 1),
                                      child: SvgPicture.asset(
                                        "assets/icons/ic_18_remove.svg",
                                        width: 18,
                                        height: 18,
                                        colorFilter: const ColorFilter.mode(
                                            KwangColor.grey600,
                                            BlendMode.srcIn),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(height: 28),
            ],
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
                              viewModel.search(e);
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
                                viewModel.search(e);
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
    );
  }
}
