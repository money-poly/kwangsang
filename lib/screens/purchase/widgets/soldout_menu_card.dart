import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/models/menu/menu_model.dart';
import 'package:immersion_kwangsang/screens/purchase/widgets/soldout_chart_widget.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/widgets/count_widget.dart';
import 'package:immersion_kwangsang/widgets/custom_network_image.dart';
import 'package:intl/intl.dart';

class SoldoutMenuCard extends StatelessWidget {
  const SoldoutMenuCard({super.key, required this.menu});

  final Menu menu;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 80,
      height: 176,
      decoration: BoxDecoration(
        border: Border.all(color: KwangColor.grey350, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(menu.name, style: KwangStyle.btn2SB),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${menu.discountRate}%",
                              style: KwangStyle.btn2B.copyWith(
                                color: KwangColor.red,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                                "${NumberFormat('###,###,###,###').format(menu.discountPrice).replaceAll(' ', ',')}원",
                                style: KwangStyle.btn2B),
                            const SizedBox(width: 10),
                            Text(
                              "${NumberFormat('###,###,###,###').format(menu.regularPrice ?? 2800).replaceAll(' ', ',')}원", // [TODO] 정가로 수정
                              style: KwangStyle.body2M.copyWith(
                                color: KwangColor.grey600,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: KwangColor.grey600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CountWidget(count: 0, add: () {}, subtract: () {})
                    ],
                  ),
                ),
                menu.imgUrl == null
                    ? Container(
                        height: 88,
                        width: 88,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: KwangColor.grey350),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                                "assets/imgs/img_44_bird_exclamation.png",
                                width: 44,
                                height: 44),
                            const Text(
                              "이미지 준비중",
                              style: TextStyle(
                                  fontSize: 10,
                                  height: 14 / 10,
                                  color: KwangColor.grey500),
                            )
                          ],
                        ),
                      )
                    : Container(
                        width: 88,
                        height: 88,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: KwangColor.grey300, width: 1),
                            borderRadius: BorderRadius.circular(4)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: CustomNetworkImage(
                            imageUrl: menu.imgUrl,
                            isFull: true,
                          ),
                        ),
                      ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              border:
                  Border(top: BorderSide(color: KwangColor.grey350, width: 1)),
            ),
            padding: const EdgeInsets.fromLTRB(16, 15, 16, 16),
            child: SoldoutChartWidget(count: menu.count ?? 2),
          )
        ],
      ),
    );
  }
}
