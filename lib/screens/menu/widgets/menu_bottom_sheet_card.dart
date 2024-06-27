import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/models/menu/menu_model.dart';
import 'package:immersion_kwangsang/screens/menu/menu_bottom_sheet_view_model.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/widgets/count_tag_widget.dart';
import 'package:immersion_kwangsang/widgets/count_widget.dart';
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
                  // TODO: connect with view model
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: CountTagWidget(count: 10),
                  )
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
              CountWidget(
                count: viewModel.selectedMenuQty[menu.id] ?? 0,
                add: () => viewModel.plusMenu(menu),
                subtract: () => viewModel.minusMenu(menu),
                bgColor: KwangColor.grey400,
              ),
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
}
