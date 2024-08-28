import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:immersion_kwangsang/enums/loading_status.dart';
import 'package:immersion_kwangsang/models/menu/menu_model.dart';
import 'package:immersion_kwangsang/screens/home/limit_stock/limit_stock_view_model.dart';
import 'package:immersion_kwangsang/screens/home/widgets/item_card.dart';
import 'package:immersion_kwangsang/screens/home/widgets/list_error_widget.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class SliverLimitStockListView extends StatefulWidget {
  const SliverLimitStockListView({super.key});

  @override
  State<SliverLimitStockListView> createState() =>
      _SliverLimitStockListViewState();
}

class _SliverLimitStockListViewState extends State<SliverLimitStockListView> {
  @override
  void initState() {
    super.initState();
    _getLimitItems();
  }

  void _getLimitItems({bool callAfterPostFrame = true}) {
    var viewModel = context.read<LimitStockViewModel>();

    if (callAfterPostFrame) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        viewModel.getMoreLimitItem();
      });
    } else {
      viewModel.getMoreLimitItem();
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LimitStockViewModel>();

    if (viewModel.limitMenu.menus.isEmpty) {
      if (viewModel.limitStatus == ELoadingStatus.done) {
        return SliverToBoxAdapter(
          child: ListErrorWidget(
            isEmptyList: true,
            message: "현재 판매 중인 상품이 없습니다.\n새로운 상품을 준비 중이니, 잠시만 기다려주세요.",
            onTapRetry: () => _getLimitItems(callAfterPostFrame: false),
          ),
        );
      }
      if (viewModel.limitStatus != ELoadingStatus.error) {
        return const _SliverFillRemaining(
          child: Center(
            child: CircularProgressIndicator(
              color: KwangColor.primary400,
            ),
          ),
        );
      }
    }

    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 26,
        crossAxisSpacing: 4,
        childAspectRatio: ((MediaQuery.sizeOf(context).width - 44) / 2) /
            (((MediaQuery.sizeOf(context).width - 44) / 2) + 90),
      ),
      itemBuilder: (context, index) {
        final menu = viewModel.limitMenu.menus[index].menu;
        final store = viewModel.limitMenu.menus[index].store;
        return ItemCard(
          buildCallback: () {
            // last item build
            if (viewModel.limitMenu.menus.length == index + 1) {
              if (viewModel.limitStatus == ELoadingStatus.loaded) {
                _getLimitItems();
              }
            }
          },
          type: ItemCardType.vertical,
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
        );
      },
      itemCount: viewModel.limitMenu.menus.length,
    );
  }
}

class _SliverFillRemaining extends SingleChildRenderObjectWidget {
  const _SliverFillRemaining({
    super.child,
  });

  @override
  _RenderSliverFillRemaining createRenderObject(BuildContext context) =>
      _RenderSliverFillRemaining();
}

class _RenderSliverFillRemaining extends RenderSliverSingleBoxAdapter {
  _RenderSliverFillRemaining();

  @override
  void performLayout() {
    final SliverConstraints constraints = this.constraints;

    double extent = constraints.remainingPaintExtent - constraints.overlap - 16;
    extent = math.max(0.0, extent);

    if (child != null) {
      child!.layout(
          constraints.asBoxConstraints(minExtent: extent, maxExtent: extent));
    }

    final double paintedChildSize =
        calculatePaintOffset(constraints, from: 0.0, to: extent);
    assert(paintedChildSize.isFinite);
    assert(paintedChildSize >= 0.0);

    final double cacheExtent =
        calculateCacheOffset(constraints, from: 0.0, to: extent);
    geometry = SliverGeometry(
      scrollExtent: extent,
      paintExtent: math.min(extent, constraints.remainingPaintExtent),
      maxPaintExtent: extent,
      hasVisualOverflow: extent > constraints.remainingPaintExtent ||
          constraints.scrollOffset > 0.0,
      cacheExtent: cacheExtent,
    );
    if (child != null) {
      setChildParentData(child!, constraints, geometry!);
    }
  }
}
