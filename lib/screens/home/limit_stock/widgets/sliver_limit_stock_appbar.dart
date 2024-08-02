import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immersion_kwangsang/enums/category.dart';
import 'package:immersion_kwangsang/enums/loading_status.dart';
import 'package:immersion_kwangsang/screens/home/limit_stock/limit_stock_view_model.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/widgets/rounded_selectable_button.dart';
import 'package:immersion_kwangsang/widgets/sort_bottom_sheet.dart';
import 'package:provider/provider.dart';

class SliverLimitStockAppBar extends StatelessWidget {
  const SliverLimitStockAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LimitStockViewModel>();

    void onTapSortWidget(BuildContext context) {
      var viewModel = context.read<LimitStockViewModel>();

      if (viewModel.limitStatus == ELoadingStatus.loading) return;
      SortButtonSheet.open(
        context,
        selectedOption: viewModel.currentSortType,
        onChanged: (selectedOption) {
          viewModel.changeSortOption(selectedOption);
        },
      );
    }

    return SliverAppBar(
      backgroundColor: KwangColor.grey100,
      surfaceTintColor: Colors.transparent,
      pinned: true,
      floating: false,
      titleSpacing: 0,
      toolbarHeight: 102,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 8),
          Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Row(
                children: [
                  Text(
                    '곧 품절이에요',
                    style: KwangStyle.header2,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      viewModel.limitMenu.totalCount.toString(),
                      style: KwangStyle.header2.copyWith(
                        color: KwangColor.grey500,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => onTapSortWidget(context),
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
                onTap: () => viewModel.changeCategory(ECategory.values[index]),
              ),
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
              itemCount: ECategory.values.length,
            ),
          ),
        ],
      ),
    );
  }
}
