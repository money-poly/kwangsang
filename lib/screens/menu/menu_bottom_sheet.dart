import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immersion_kwangsang/screens/menu/menu_bottom_sheet_view_model.dart';
import 'package:immersion_kwangsang/screens/menu/widgets/menu_bottom_sheet_card.dart';
import 'package:immersion_kwangsang/screens/purchase_info/purchase_info_view.dart';
import 'package:immersion_kwangsang/screens/purchase_info/purchase_info_view_model.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/widgets/count_widget.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class MenuBottomSheet extends StatelessWidget {
  const MenuBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MenuBottomSheetViewModel>(context);
    return Hero(
      tag: 'MenuBottomSheet',
      child: Material(
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Colors.black.withOpacity(0.2),
              ),
            ],
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(16),
            ),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  if (viewModel.isExpanded) {
                    viewModel.shrink();
                  } else {
                    viewModel.expaned();
                  }
                },
                child: SizedBox(
                  height: 33,
                  child: Center(
                    child: Transform.rotate(
                      angle: viewModel.isExpanded ? math.pi : 0,
                      child: SvgPicture.asset(
                        "assets/icons/ic_30_arrow_up.svg",
                        width: 30,
                        height: 10,
                      ),
                    ),
                  ),
                ),
              ),
              if (viewModel.isExpanded)
                Column(
                  children: [
                    for (var menu in viewModel.selectedMenu)
                      MenuBottomSheetCard(menu: menu),
                  ],
                ),
              Container(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 16,
                  top: 9,
                ),
                height: 77,
                child: Row(
                  children: [
                    if (!viewModel.isExpanded)
                      CountWidget(
                        count:
                            viewModel.selectedMenuQty[viewModel.mainItem?.id] ??
                                0,
                        add: () => viewModel.plusMenu(viewModel.mainItem!),
                        subtract: () =>
                            viewModel.minusMenu(viewModel.mainItem!),
                        size: CountWidgetSize.large,
                      ),
                    if (!viewModel.isExpanded) const SizedBox(width: 10),
                    Flexible(
                      flex: 1,
                      child: GestureDetector(
                        // TODO: Temporary routing to purchase info screem
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ChangeNotifierProvider(
                                create: (_) =>
                                    PurchaseInfoViewModel(isMember: true),
                                child: const PurchaseInfoView(),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: KwangColor.primary400,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              '${NumberFormat('###,###,###,###').format(viewModel.totalCost())}원 주문하기',
                              style: KwangStyle.btn2B
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // TODO: MediaQuery가 0으로 나오는 문제
              SizedBox(
                height: MediaQuery.of(context).padding.bottom + 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
