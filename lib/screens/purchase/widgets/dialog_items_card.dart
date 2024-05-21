import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/models/menu.dart';
import 'package:immersion_kwangsang/screens/purchase/widgets/dialog_item_row.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';

enum ItemType {
  soldout("품절된 상품"),
  change("수량 변경된 상품");

  const ItemType(this.title);
  final String title;
}

class DialogItemsWidget extends StatelessWidget {
  const DialogItemsWidget(
      {super.key, required this.itemType, required this.menus});

  final ItemType itemType;
  final List<Menu> menus;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(8),
            ),
            color: KwangColor.grey400,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                itemType.title,
                style: KwangStyle.btn3.copyWith(
                  color: KwangColor.grey800,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(8),
            ),
            color: KwangColor.grey300,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              menus.length,
              (idx) => DialogItemRow(
                itemType: itemType,
                name: menus[idx].name,
                before: 3,
                after: 0,
                isLast: (menus.length - 1) == idx,
              ),
            ),
          ),
        )
      ],
    );
  }
}
