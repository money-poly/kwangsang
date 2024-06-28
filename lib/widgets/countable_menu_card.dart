import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immersion_kwangsang/models/menu/menu_model.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/widgets/count_tag_widget.dart';
import 'package:immersion_kwangsang/widgets/count_widget.dart';
import 'package:immersion_kwangsang/widgets/custom_network_image.dart';
import 'package:intl/intl.dart';

enum CMenuCardType { small, large, removable }

class CountableMenuCard extends StatelessWidget {
  const CountableMenuCard(
      {super.key,
      required this.menu,
      required this.type,
      required this.add,
      required this.subtract,
      this.remove});

  final Menu menu;
  final CMenuCardType type;
  final Function() add;
  final Function() subtract;
  final Function()? remove;
  @override
  Widget build(BuildContext context) {
    switch (type) {
      case CMenuCardType.small:
        return Container(
          height: 100,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: KwangColor.grey350, width: 1),
          ),
          child: Row(
            children: [
              menu.imgUrl == null
                  ? Container(
                      height: 72,
                      width: 72,
                      padding: const EdgeInsets.only(top: 3, bottom: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: KwangColor.grey350),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/imgs/img_44_bird_exclamation.png",
                              width: 44, height: 44),
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
                      width: 72,
                      height: 72,
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
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      menu.name,
                      style: KwangStyle.btn2SB.copyWith(
                        color: KwangColor.grey800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      NumberFormat('###,###,###,###')
                          .format(2500) // [TODO] 정가로 값 변경)
                          .replaceAll(' ', ','),
                      style: KwangStyle.body1M.copyWith(
                        color: KwangColor.grey600,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: KwangColor.grey600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          "${menu.discountRate}%",
                          style:
                              KwangStyle.btn2B.copyWith(color: KwangColor.red),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "${NumberFormat('###,###,###,###').format(menu.discountPrice).replaceAll(' ', ',')}원",
                          style: KwangStyle.btn2B,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CountTagWidget(count: menu.count ?? 2),
                  CountWidget(count: 4, add: add, subtract: subtract)
                ],
              )
            ],
          ),
        );
      case CMenuCardType.large:
        return SizedBox(
          height: 86,
          child: Row(
            children: [
              menu.imgUrl == null
                  ? Container(
                      height: 86,
                      width: 86,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: KwangColor.grey350),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/imgs/img_44_bird_exclamation.png",
                              width: 44, height: 44),
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
                      width: 86,
                      height: 86,
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
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      menu.name,
                      style: KwangStyle.btn2SB.copyWith(
                        color: KwangColor.grey800,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          NumberFormat('###,###,###,###')
                              .format(2500) // [TODO] 정가로 값 변경)
                              .replaceAll(' ', ','),
                          style: KwangStyle.body1M.copyWith(
                            color: KwangColor.grey600,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: KwangColor.grey600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              "${menu.discountRate}%",
                              style: KwangStyle.btn2B
                                  .copyWith(color: KwangColor.red),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "${NumberFormat('###,###,###,###').format(menu.discountPrice).replaceAll(' ', ',')}원",
                              style: KwangStyle.btn2B,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CountTagWidget(count: menu.count ?? 2),
                  CountWidget(count: 3, add: add, subtract: subtract),
                ],
              )
            ],
          ),
        );
      case CMenuCardType.removable:
        return SizedBox(
          height: 78,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              menu.imgUrl == null
                  ? Container(
                      height: 78,
                      width: 78,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: KwangColor.grey350),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/imgs/img_44_bird_exclamation.png",
                              width: 44, height: 44),
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
                      width: 78,
                      height: 78,
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
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width - 212,
                                ),
                                child: Text(
                                  menu.name,
                                  style: KwangStyle.btn2SB.copyWith(
                                    color: KwangColor.grey800,
                                  ),
                                  softWrap: true,
                                ),
                              ),
                              const SizedBox(width: 4),
                              CountTagWidget(count: menu.count ?? 2),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: remove,
                          child: SvgPicture.asset(
                            "assets/icons/ic_18_remove.svg",
                            width: 20,
                            height: 20,
                            colorFilter: const ColorFilter.mode(
                                KwangColor.grey400, BlendMode.srcIn),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              NumberFormat('###,###,###,###')
                                  .format(2500) // [TODO] 정가로 값 변경)
                                  .replaceAll(' ', ','),
                              style: KwangStyle.body1M.copyWith(
                                color: KwangColor.grey600,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: KwangColor.grey600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Text(
                                  "${menu.discountRate}%",
                                  style: KwangStyle.btn2B
                                      .copyWith(color: KwangColor.red),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  "${NumberFormat('###,###,###,###').format(menu.discountPrice).replaceAll(' ', ',')}원",
                                  style: KwangStyle.btn2B,
                                ),
                              ],
                            ),
                          ],
                        ),
                        CountWidget(
                          count: 3,
                          add: add,
                          subtract: subtract,
                          bgColor: KwangColor.grey400,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      default:
        return const SizedBox();
    }
  }
}
