import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:immersion_kwangsang/models/menu.dart';
import 'package:immersion_kwangsang/screens/purchase/widgets/dialog_items_card.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';

class PurchaseCheckDialog extends StatelessWidget {
  const PurchaseCheckDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Menu> tempMenus = [
      Menu(
        id: 1,
        name: "감자 휘낭시에",
        imgUrl: null,
        discountRate: 10,
        discountPrice: 2000,
      ),
      Menu(
        id: 2,
        name: "고구마 휘낭시에",
        imgUrl: null,
        discountRate: 10,
        discountPrice: 2000,
      ),
    ];
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: KwangColor.grey100,
      titlePadding: EdgeInsets.zero,
      contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      actionsPadding: EdgeInsets.zero,
      actions: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: Container(
                    height: 52,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: KwangColor.primary100),
                    child: Text(
                      "주문 취소",
                      style: KwangStyle.btn2B
                          .copyWith(color: KwangColor.primary400),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 52,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: KwangColor.primary400),
                    child: Text(
                      "이어서 하기",
                      style:
                          KwangStyle.btn2B.copyWith(color: KwangColor.grey100),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
      content: SizedBox(
        height: 400,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/ic_36_exclamation.svg",
                    width: 36,
                    height: 36,
                    colorFilter: const ColorFilter.mode(
                        KwangColor.grey600, BlendMode.srcIn),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "품절되거나\n수량이 변경된 품목이 있어요",
                    style: KwangStyle.header1,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  if (tempMenus.isNotEmpty)
                    DialogItemsWidget(
                        itemType: ItemType.soldout, menus: tempMenus),
                  if (tempMenus.isNotEmpty) const SizedBox(height: 10),
                  if (tempMenus.isNotEmpty)
                    DialogItemsWidget(
                        itemType: ItemType.change, menus: tempMenus),
                  Padding(
                    padding: const EdgeInsets.only(top: 24, bottom: 20),
                    child: Text(
                      "변경사항대로 이어서 진행하시겠습니까?",
                      style:
                          KwangStyle.body1M.copyWith(color: KwangColor.grey800),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
