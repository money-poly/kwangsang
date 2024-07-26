import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immersion_kwangsang/enums/category.dart';
import 'package:immersion_kwangsang/models/menu/menu_model.dart';
import 'package:immersion_kwangsang/screens/home/best_product/best_product_view_model.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/widgets/menu_rank_card.dart';
import 'package:immersion_kwangsang/widgets/rounded_selectable_button.dart';
import 'package:immersion_kwangsang/widgets/sort_bottom_sheet.dart';
import 'package:provider/provider.dart';

class BestProductView extends StatefulWidget {
  const BestProductView({super.key});

  @override
  State<BestProductView> createState() => _BestProductViewState();
}

class _BestProductViewState extends State<BestProductView>
    with AutomaticKeepAliveClientMixin {
  void _onTapCatetory(ECategory category) {
    var viewModel = context.read<BestProductViewModel>();
    viewModel.changeCategory(category);
  }

  void _onTapSortWidget() {
    var viewModel = context.read<BestProductViewModel>();
    SortButtonSheet.open(
      context,
      selectedOption: viewModel.currentSortType,
      onChanged: (selectedOption) {
        viewModel.changeSortOption(selectedOption);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final viewModel = context.watch<BestProductViewModel>();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: KwangColor.grey100,
            surfaceTintColor: Colors.transparent,
            titleSpacing: 0,
            toolbarHeight: 96,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 8),
                SizedBox(
                  height: 54,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => RoundedSelectableButton(
                      text: ECategory.values[index].title,
                      isSelected:
                          ECategory.values[index] == viewModel.currentCategory,
                      onTap: () => _onTapCatetory(ECategory.values[index]),
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                    itemCount: ECategory.values.length,
                  ),
                ),
                Container(
                  height: 34,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '17:30 업데이트',
                          style: KwangStyle.body2M.copyWith(
                            color: KwangColor.grey600,
                          ),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: _onTapSortWidget,
                          child: Row(
                            children: [
                              Text(
                                viewModel.currentSortType.text,
                                style: KwangStyle.btn2,
                              ),
                              const SizedBox(width: 4),
                              SvgPicture.asset(
                                "assets/icons/ic_18_order.svg",
                                colorFilter: const ColorFilter.mode(
                                  KwangColor.grey700,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 8,
            ),
            sliver: SliverList.separated(
              itemBuilder: (context, index) => MenuRankCard(
                menu: Menu(
                  id: index,
                  store: 'GS25',
                  name: '우유생크림빵',
                  imgUrl: null,
                  discountRate: 10,
                  discountPrice: 2520,
                  regularPrice: 11000,
                  count: 1,
                  view: 2,
                ),
                rank: index + 1,
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemCount: 20,
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
