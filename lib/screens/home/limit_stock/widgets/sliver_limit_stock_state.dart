import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/enums/loading_status.dart';
import 'package:immersion_kwangsang/screens/home/limit_stock/limit_stock_view_model.dart';
import 'package:immersion_kwangsang/screens/home/widgets/list_error_widget.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:provider/provider.dart';

class SliverLimitStockState extends StatelessWidget {
  const SliverLimitStockState({super.key});

  void _getLimitItems(
    BuildContext context, {
    bool callAfterPostFrame = true,
  }) {
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

    if (viewModel.limitStatus == ELoadingStatus.error) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: ListErrorWidget(
            message: viewModel.limitErrorMessage!,
            onTapRetry: () =>
                _getLimitItems(context, callAfterPostFrame: false),
          ),
        ),
      );
    }

    if (viewModel.limitStatus != ELoadingStatus.done &&
        viewModel.limitMenu.menus.isNotEmpty) {
      return const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Center(
            child: CircularProgressIndicator(
              color: KwangColor.primary400,
            ),
          ),
        ),
      );
    }

    return const SliverToBoxAdapter();
  }
}
