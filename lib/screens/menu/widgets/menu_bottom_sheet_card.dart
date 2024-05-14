import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/models/menu.dart';
import 'package:immersion_kwangsang/screens/menu/menu_bottom_sheet_view_model.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MenuBottomSheetCard extends StatelessWidget {
  final Menu menu;

  const MenuBottomSheetCard({
    super.key,
    required this.menu,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MenuBottomSheetViewModel>(context);
    return Container(
      height: 100,
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 10,
      ),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: KwangColor.grey300,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1,
          color: KwangColor.grey400,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    menu.name,
                    style: KwangStyle.btn2SB,
                  ),
                  // TODO: 잔여수량 위젯 배치
                ],
              ),
              GestureDetector(
                onTap: () {
                  viewModel.removeItem(menu);
                },
                child: const Icon(
                  Icons.close,
                  color: KwangColor.grey500,
                  size: 20,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _counter(viewModel),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${NumberFormat('###,###,###,###').format(menu.regularPrice).replaceAll(' ', ',')}원",
                    style: KwangStyle.body1.copyWith(
                      color: KwangColor.grey600,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: KwangColor.grey600,
                    ),
                  ),
                  const SizedBox(width: 7),
                  Text(
                    "${NumberFormat('###,###,###,###').format(menu.discountPrice).replaceAll(' ', ',')}원",
                    style: KwangStyle.btn1B,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _counter(MenuBottomSheetViewModel viewModel) {
    var qty = viewModel.selectedMenuQty[menu.id] ?? 0;
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 100,
      decoration: BoxDecoration(
        color: KwangColor.grey400,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => viewModel.minusMenu(viewModel.mainItem!),
            child: Container(
              padding: const EdgeInsets.all(1),
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Center(
                child: Icon(
                  Icons.remove_rounded,
                  color: qty == 0 ? KwangColor.grey500 : KwangColor.grey700,
                  size: 16,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Center(
              child: Text(
                qty.toString(),
                style: KwangStyle.body1M,
              ),
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => viewModel.plusMenu(viewModel.mainItem!),
            child: Container(
              padding: const EdgeInsets.all(1),
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: const Center(
                child: Icon(
                  Icons.add_rounded,
                  color: KwangColor.grey700,
                  size: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
