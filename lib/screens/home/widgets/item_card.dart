import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immersion_kwangsang/models/menu.dart';
import 'package:immersion_kwangsang/screens/home/widgets/item_discount_widget.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/utils/datetime_formatter.dart';
import 'package:immersion_kwangsang/utils/number_formatter.dart';
import 'package:immersion_kwangsang/widgets/count_tag_widget.dart';
import 'package:immersion_kwangsang/widgets/discount_widget.dart';
import 'package:immersion_kwangsang/widgets/menu_img_card.dart';

enum ItemCardType {
  miniSelling,
  miniSoon,
  vertical,
  verticalCount,
  bigSquare,
}

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.type, required this.menu});

  final ItemCardType type;
  final Menu menu;
  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ItemCardType.bigSquare:
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: KwangColor.black.withOpacity(0.2),
                blurRadius: 4,
                offset: const Offset(0, 0),
              ),
            ],
            borderRadius: BorderRadius.circular(12),
            color: KwangColor.grey100,
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: KwangColor.grey500),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: ExtendedImage.network(
                        menu.imgUrl ?? "",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 8,
                    bottom: 8,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: KwangColor.grey500, width: 1),
                        borderRadius: BorderRadius.circular(5),
                        color: KwangColor.grey100,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(menu.name, style: KwangStyle.btn2SB),
                          const SizedBox(height: 2),
                          Text(
                            "소비기한 : ${menu.expiredDate != null ? dateToStr(DateTimeStrType.slash, menu.expiredDate!) : "미정"}",
                            style: KwangStyle.body3.copyWith(
                              color: KwangColor.grey800,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 52,
                    bottom: 56,
                    child: Transform.rotate(
                      angle: 25,
                      child: ItemDiscountWidget(menu: menu),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {},
                      child: Row(
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: KwangColor.grey400,
                            ),
                            child: Text(
                              "로고",
                              style: KwangStyle.btn2B.copyWith(
                                color: KwangColor.grey100,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(menu.store ?? "가게명"),
                          SvgPicture.asset(
                            "assets/icons/ic_20_arrow_right.svg",
                            width: 18,
                            height: 18,
                          ),
                        ],
                      ),
                    ),
                    CountTagWidget(count: menu.count ?? 0),
                  ],
                ),
              )
            ],
          ),
        );
      case ItemCardType.miniSoon:
        return SizedBox(
          width: 106,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  MenuImgCard(imgUrl: menu.imgUrl, size: 106),
                  Container(
                    width: 106,
                    height: 106,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: KwangColor.grey600.withOpacity(0.4),
                    ),
                  ),
                  const Positioned(
                    right: 6,
                    top: 6,
                    child: DiscountWidget(size: 32, discountRate: 50),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(commaNumberFormatter(menu.discountPrice),
                      style: KwangStyle.btn2B),
                  const SizedBox(width: 4),
                  Text(
                    commaNumberFormatter(
                        menu.regularPrice ?? 0), // [TODO] 정가로 교체
                    style: KwangStyle.body3.copyWith(
                      color: KwangColor.grey600,
                      decoration: TextDecoration.lineThrough,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 2),
              Text(menu.name, style: KwangStyle.body2),
              const SizedBox(height: 4),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("예상수량", style: KwangStyle.body3M),
                    const VerticalDivider(
                      color: KwangColor.grey600,
                      width: 12,
                      thickness: 1,
                      indent: 1,
                      endIndent: 1,
                    ),
                    Text("${menu.count ?? 0}개",
                        style: KwangStyle.body3M
                            .copyWith(color: KwangColor.lightBlue)),
                  ],
                ),
              )
            ],
          ),
        );
      case ItemCardType.miniSelling:
        return SizedBox(
          width: 106,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MenuImgCard(imgUrl: menu.imgUrl, size: 106),
              const SizedBox(height: 4),
              Text(
                menu.store ?? "가게명",
                style: KwangStyle.body2.copyWith(
                  color: KwangColor.grey700,
                ),
              ), // [TODO] 매장명으로 변경
              const SizedBox(height: 2),
              Text(menu.name, style: KwangStyle.body2),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "${menu.discountRate}%",
                    style: KwangStyle.btn3.copyWith(color: KwangColor.red),
                  ),
                  const SizedBox(width: 4),
                  Text(commaNumberFormatter(menu.discountPrice),
                      style: KwangStyle.btn3),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/ic_24_view.svg",
                    width: 16,
                    height: 16,
                    colorFilter: ColorFilter.mode(
                      KwangColor.grey900.withOpacity(0.6),
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "${menu.view ?? 0}", // [TODO] 조회수로 교체
                    style: KwangStyle.body3.copyWith(
                      color: KwangColor.grey700,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      case ItemCardType.vertical || ItemCardType.verticalCount:
        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: KwangColor.grey400,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(4)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: ExtendedImage.network(menu.imgUrl ?? ""),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    right: 8,
                    child: CountTagWidget(count: menu.count ?? 0),
                  ),
                  Positioned(
                    right: 8,
                    bottom: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: KwangColor.grey100.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/ic_14_view.svg",
                            width: 16,
                            height: 16,
                            colorFilter: const ColorFilter.mode(
                              KwangColor.grey800,
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "${menu.view ?? 0}",
                            style: KwangStyle.body3M
                                .copyWith(color: KwangColor.grey800),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      menu.store ?? "가게명",
                      style: KwangStyle.body3M.copyWith(
                        color: KwangColor.grey600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(menu.name, style: KwangStyle.body1M),
                    const SizedBox(height: 2),
                    Text(
                      commaNumberFormatter(menu.regularPrice ?? 0),
                      style: KwangStyle.body1M.copyWith(
                        color: KwangColor.grey700,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Text(
                          "${menu.discountRate}%",
                          style: KwangStyle.header3.copyWith(
                            color: KwangColor.red,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(commaNumberFormatter(menu.discountPrice),
                            style: KwangStyle.header3),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      default:
        return const Placeholder();
    }
  }
}
