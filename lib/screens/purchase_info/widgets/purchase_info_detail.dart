import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:immersion_kwangsang/models/menu.dart';
// import 'package:immersion_kwangsang/screens/purchase_info/purchase_info_view_model.dart';
import 'package:immersion_kwangsang/widgets/card_h_spliter.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';

class PurchaseInfoDetail extends StatelessWidget {
  const PurchaseInfoDetail({super.key});

  // TODO: delete mocking data
  static List<Menu> items = [
    for (int i = 0; i < 3; i++)
      Menu(
        id: 1,
        name: 'Menu $i',
        imgUrl: 'imgUrl',
        discountRate: 10,
        regularPrice: 10000,
        discountPrice: 9000,
      ),
  ];

  @override
  Widget build(BuildContext context) {
    // final viewModel = Provider.of<PurchaseInfoViewModel>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      child: Column(
        children: [
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '상세 주문 내역',
                style: KwangStyle.header2,
              ),
              Text(
                'No.${123456}',
                style: KwangStyle.btn1SB.copyWith(
                  color: KwangColor.grey700,
                ),
              ),
            ],
          ),
          for (var item in items)
            _item(
              name: item.name,
              regularPrice: item.regularPrice!,
              discountPrice: item.discountPrice,
              qty: 1,
            ),
          const SizedBox(height: 18),
          const CardHSpliter(size: 1),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '총 결제 금액',
                style: KwangStyle.header3,
              ),
              Row(
                children: [
                  Text(
                    '${NumberFormat(
                      '###,###,###,###',
                    ).format(
                          items.fold(0, (prev, e) => prev + e.regularPrice!),
                        ).replaceAll(' ', ',')}원',
                    style: KwangStyle.header3.copyWith(
                      color: KwangColor.grey500,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: KwangColor.grey500,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${NumberFormat(
                      '###,###,###,###',
                    ).format(
                          items.fold(0, (prev, e) => prev + e.discountPrice),
                        ).replaceAll(' ', ',')}원',
                    style: KwangStyle.header3.copyWith(
                      color: KwangColor.grey800,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '총 할인 금액',
                style: KwangStyle.body1M,
              ),
              Row(
                children: [
                  Text(
                    '-${NumberFormat(
                      '###,###,###,###',
                    ).format(
                          items.fold(0, (prev, e) => prev + e.regularPrice!) -
                              items.fold(
                                  0, (prev, e) => prev + e.discountPrice),
                        ).replaceAll(' ', ',')}원',
                    style: KwangStyle.btn2SB.copyWith(
                      color: KwangColor.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _item({
    required String name,
    required int qty,
    required int regularPrice,
    required int discountPrice,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: Row(
        children: [
          Flexible(
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    name,
                    style: KwangStyle.body1M.copyWith(
                      color: KwangColor.grey800,
                    ),
                  ),
                ),
                Text(
                  ' x $qty',
                  style: KwangStyle.body1M.copyWith(
                    color: KwangColor.grey800,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Row(
            children: [
              Text(
                '${NumberFormat('###,###,###,###').format(regularPrice).replaceAll(' ', ',')}원',
                style: KwangStyle.body1M.copyWith(
                  color: KwangColor.grey500,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: KwangColor.grey500,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${NumberFormat('###,###,###,###').format(discountPrice).replaceAll(' ', ',')}원',
                style: KwangStyle.body1M.copyWith(
                  color: KwangColor.grey800,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
