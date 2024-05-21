import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/screens/purchase/widgets/dialog_items_card.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';

class DialogItemRow extends StatelessWidget {
  const DialogItemRow(
      {super.key,
      required this.itemType,
      required this.name,
      required this.before,
      required this.after,
      this.isLast = false});

  final ItemType itemType;
  final String name;
  final int before;
  final int after;
  final bool isLast;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  name,
                  style: KwangStyle.body1M,
                ),
              ),
              const SizedBox(width: 4),
              Row(
                children: [
                  Text("$before개",
                      style: KwangStyle.body1M
                          .copyWith(color: KwangColor.grey700)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text("→",
                        style: KwangStyle.body1M
                            .copyWith(color: KwangColor.grey700)),
                  ),
                  Text(
                    "$after개",
                    style: KwangStyle.body1M.copyWith(
                      color: itemType == ItemType.soldout
                          ? KwangColor.red
                          : KwangColor.grey900,
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (!isLast)
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 1,
              color: KwangColor.grey400,
            ),
        ],
      ),
    );
  }
}
