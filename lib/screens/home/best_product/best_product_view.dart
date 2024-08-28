import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immersion_kwangsang/enums/category.dart';
import 'package:immersion_kwangsang/enums/loading_status.dart';
import 'package:immersion_kwangsang/models/menu/menu_model.dart';
import 'package:immersion_kwangsang/screens/home/best_product/best_product_view_model.dart';
import 'package:immersion_kwangsang/screens/home/widgets/list_error_widget.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/utils/extensions.dart';
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
  @override
  void initState() {
    super.initState();
    _getItems();
  }

  void _onTapCatetory(ECategory category) {
    var viewModel = context.read<BestProductViewModel>();

    if (viewModel.status == ELoadingStatus.loading) return;
    viewModel.changeCategory(category);
  }

  void _onTapSortWidget() {
    var viewModel = context.read<BestProductViewModel>();

    if (viewModel.status == ELoadingStatus.loading) return;
    SortButtonSheet.open(
      context,
      selectedOption: viewModel.currentSortType,
      onChanged: (selectedOption) {
        viewModel.changeSortOption(selectedOption);
      },
    );
  }

  void _getItems({bool callAfterPostFrame = true}) {
    var viewModel = context.read<BestProductViewModel>();

    if (callAfterPostFrame) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        viewModel.getMoreItem();
      });
    } else {
      viewModel.getMoreItem();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final viewModel = context.watch<BestProductViewModel>();

    return Scaffold(
      body: Column(
        children: [
          Column(
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
                        '${viewModel.lastUpdateTime.toMMSS()} 업데이트',
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
          Expanded(
            child: _listBody(viewModel),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  Widget _listBody(BestProductViewModel viewModel) {
    if (viewModel.status == ELoadingStatus.done &&
        viewModel.menuItems.isEmpty) {
      return ListErrorWidget(
        isEmptyList: true,
        message: "현재 판매 중인 상품이 없습니다.\n새로운 상품을 준비 중이니, 잠시만 기다려주세요.",
        onTapRetry: () => _getItems(callAfterPostFrame: false),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      child: ListView.separated(
        controller: viewModel.scrollController,
        itemBuilder: (context, index) {
          if (index == viewModel.menuItems.length) {
            if (viewModel.status == ELoadingStatus.error) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ListErrorWidget(
                  message: viewModel.errorMessage!,
                  onTapRetry: () => _getItems(callAfterPostFrame: false),
                ),
              );
            }

            if (viewModel.status != ELoadingStatus.done) {
              return const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Center(
                  child: CircularProgressIndicator(
                    color: KwangColor.primary400,
                  ),
                ),
              );
            }
          }

          var menu = viewModel.menuItems[index].menu;
          var store = viewModel.menuItems[index].store;

          return MenuRankCard(
            buildCallback: () {
              // last item build
              if (viewModel.menuItems.length == index + 1) {
                if (viewModel.status == ELoadingStatus.loaded) {
                  _getItems();
                }
              }
            },
            menu: Menu(
              id: menu.id,
              store: store.name,
              name: menu.name,
              imgUrl: menu.imgUrl,
              discountRate: menu.discountRate,
              discountPrice: menu.discountPrice,
              regularPrice: menu.regularPrice,
              count: menu.count,
              view: menu.view,
            ),
            rank: index + 1,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemCount: viewModel.menuItems.length +
            (viewModel.status == ELoadingStatus.done ? 0 : 1),
      ),
    );
  }
}
