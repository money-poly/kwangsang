import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immersion_kwangsang/models/menu.dart';
import 'package:immersion_kwangsang/screens/menu/menu_bottom_sheet.dart';
import 'package:immersion_kwangsang/screens/menu/menu_bottom_sheet_view_model.dart';
import 'package:immersion_kwangsang/screens/menu/menu_view_model.dart';
import 'package:immersion_kwangsang/screens/menu/widgets/menu_info_col.dart';
import 'package:immersion_kwangsang/services/amplitude.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/utils/origin_formatter.dart';
import 'package:immersion_kwangsang/widgets/bullet_string.dart';
import 'package:immersion_kwangsang/widgets/countable_menu_card.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key, required this.menuId});

  final int menuId;
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MenuViewModel>(context);
    final analytics = AnalyticsConfig();

    if (viewModel.menu != null) {
      var menu = viewModel.menu;
      Provider.of<MenuBottomSheetViewModel>(context).setMainItem(Menu(
        id: menuId,
        name: menu!.name,
        imgUrl: menu.menuPictureUrl,
        regularPrice: menu.regularPrice,
        discountRate: menu.discountRate,
        discountPrice: menu.discountPrice,
      ));
    }
    return Scaffold(
      backgroundColor: KwangColor.grey100,
      appBar: AppBar(
        title: Text("상품상세", style: KwangStyle.header2),
        toolbarHeight: 52,
        titleSpacing: 8,
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: SvgPicture.asset(
              "assets/icons/ic_36_back.svg",
              width: 36,
              height: 36,
            ),
          ),
        ),
        leadingWidth: 44,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: viewModel.menu == null
          ? const Center(
              child: CircularProgressIndicator(
              color: KwangColor.primary400,
            ))
          : RefreshIndicator(
              color: KwangColor.primary400,
              backgroundColor: KwangColor.grey100,
              onRefresh: () async {
                viewModel.getDetailMenu(menuId);
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (viewModel.menu!.menuPictureUrl != null)
                      Stack(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 244,
                            child: ExtendedImage.network(
                                viewModel.menu!.menuPictureUrl!,
                                fit: BoxFit.cover),
                          ),
                          if (viewModel.menu!.count == 0)
                            Container(
                              height: 244,
                              alignment: Alignment.center,
                              color: KwangColor.black.withOpacity(0.4),
                              child: Text(
                                "품절",
                                style: KwangStyle.header3.copyWith(
                                  color: KwangColor.grey100,
                                ),
                              ),
                            )
                        ],
                      ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // if (viewModel.menu!.description != null)
                              //   Text(
                              //     viewModel.menu!.description!,
                              //     style: const TextStyle(
                              //         fontSize: 12,
                              //         fontWeight: FontWeight.w500,
                              //         color: KwangColor.grey600),
                              //   ),
                              // if (viewModel.menu!.description != null)
                              //   const SizedBox(
                              //     height: 4,
                              //   ),
                              GestureDetector(
                                onTap: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      viewModel.menu!.store.name,
                                      style: KwangStyle.btn2SB
                                          .copyWith(color: KwangColor.grey700),
                                    ),
                                    SvgPicture.asset(
                                      "assets/icons/ic_20_arrow_right.svg",
                                      width: 20,
                                      height: 20,
                                      colorFilter: const ColorFilter.mode(
                                          KwangColor.grey600, BlendMode.srcIn),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                viewModel.menu!.name,
                                style: KwangStyle.header1,
                                softWrap: true,
                                overflow: TextOverflow.visible,
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${NumberFormat('###,###,###,###').format(viewModel.menu!.regularPrice).replaceAll(' ', ',')}원",
                                    style: KwangStyle.header1.copyWith(
                                        color: KwangColor.grey600,
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 14),
                                    child: Row(
                                      children: [
                                        Text(
                                          "${viewModel.menu!.discountRate}%",
                                          style: KwangStyle.header0
                                              .copyWith(color: KwangColor.red),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                            "${NumberFormat('###,###,###,###').format(viewModel.menu!.discountPrice).replaceAll(' ', ',')}원",
                                            style: KwangStyle.header0),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          width: MediaQuery.of(context).size.width - 40,
                          height: 1,
                          color: KwangColor.grey300,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            border: Border.all(color: KwangColor.grey350),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 8),
                          child: IntrinsicHeight(
                            child: Row(
                              children: [
                                Expanded(
                                  child: MenuInfoCol(
                                    title: "픽업 시간",
                                    content:
                                        "${viewModel.menu!.store.pickUpTime}분",
                                  ),
                                ),
                                const VerticalDivider(
                                  color: KwangColor.grey300,
                                  thickness: 1,
                                  indent: 4,
                                  endIndent: 4,
                                ),
                                const Expanded(
                                  child: MenuInfoCol(
                                    title: "소비 기한",
                                    content: "2일 남음", // [TODO] 소비 기한 데이터 넣기
                                  ),
                                ),
                                const VerticalDivider(
                                  color: KwangColor.grey300,
                                  thickness: 1,
                                  indent: 4,
                                  endIndent: 4,
                                ),
                                const Expanded(
                                  child: MenuInfoCol(
                                    title: "잔여 수량",
                                    content: "3개 남음", // [TODO] 잔여 수량 데이터 넣기
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (viewModel.menu!.origins.isNotEmpty)
                          Container(
                            margin: const EdgeInsets.only(
                                top: 8, left: 20, right: 20),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              border: Border.all(color: KwangColor.grey300),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "원산지 표기",
                                  style: KwangStyle.body2M
                                      .copyWith(color: KwangColor.grey600),
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Text(
                                    originFormatter(viewModel.menu!.origins),
                                    style: KwangStyle.body2M.copyWith(
                                        color: KwangColor.grey800,
                                        overflow: TextOverflow.visible),
                                    softWrap: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (viewModel.menu!.anotherMenus.isNotEmpty ||
                            viewModel.menu!.origins.isNotEmpty)
                          Container(
                            margin: const EdgeInsets.only(top: 20, bottom: 8),
                            height: 4,
                            color: KwangColor.grey200,
                          ),
                        if (viewModel.menu!.anotherMenus.isNotEmpty)
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("할인율이 높은 메뉴", style: KwangStyle.header2),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      "메뉴 전체보기",
                                      style: KwangStyle.btn3.copyWith(
                                        color: KwangColor.grey600,
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        if (viewModel.menu!.anotherMenus.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 20),
                            child: ListView.separated(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              separatorBuilder: (context, idx) {
                                return const SizedBox(height: 10);
                              },
                              itemCount: viewModel.menu!.anotherMenus.length,
                              itemBuilder: (context, idx) => GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () async {
                                  analytics.changePage("메뉴상세", "메뉴상세");
                                  analytics.clickMenu(
                                    MenuSimple.fromMenu(
                                        viewModel.menu!.anotherMenus[idx]),
                                    {
                                      "page": "메뉴상세",
                                      "title": "할인율이 높은 메뉴",
                                      "options": {}
                                    },
                                  );
                                  await Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => ChangeNotifierProvider(
                                        create: (_) => MenuViewModel(viewModel
                                            .menu!.anotherMenus[idx].id),
                                        child: MenuView(
                                            menuId: viewModel
                                                .menu!.anotherMenus[idx].id),
                                      ),
                                    ),
                                  );
                                  analytics.changePage("메뉴상세", "메뉴상세");
                                },
                                child: CountableMenuCard(
                                  menu: viewModel.menu!.anotherMenus[idx],
                                  type: CMenuCardType.small,
                                  add: () {},
                                  subtract: () {},
                                ),
                              ),
                            ),
                          ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 4, top: 20),
                          height: 4,
                          color: KwangColor.grey200,
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 20),
                            child: Text("유의사항", style: KwangStyle.header2)),
                        Container(
                          margin: EdgeInsets.only(
                              top: 8,
                              bottom:
                                  MediaQuery.of(context).viewPadding.bottom +
                                      102),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: viewModel.menu!.cautions
                                .map((e) => BulletString(
                                      txt: e,
                                      style: KwangStyle.body2,
                                      hasBottomPadding: viewModel.menu!.cautions
                                              .indexOf(e) !=
                                          viewModel.menu!.cautions.length - 1,
                                    ))
                                .toList(),
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ],
                ),
              ),
            ),
      bottomSheet: const MenuBottomSheet(),

      // Container(
      //   padding: EdgeInsets.fromLTRB(
      //       20, 11, 20, 11 + MediaQuery.of(context).viewPadding.bottom),
      //   decoration: const BoxDecoration(
      //     color: Colors.white,
      //     border: Border(
      //       top: BorderSide(width: 1.0, color: KwangColor.grey300),
      //     ),
      //   ),
      //   child: GestureDetector(
      //     onTap: () {
      //       showDialog(
      //           context: context,
      //           builder: (context) =>
      //               const CustomAlertDialog(type: AlertType.developing));
      //     },
      //     child: Container(
      //       height: 44,
      //       alignment: Alignment.center,
      //       decoration: BoxDecoration(
      //         color: KwangColor.primary400,
      //         borderRadius: BorderRadius.circular(8),
      //       ),
      //       child: Text("전화하기",
      //           style: KwangStyle.btn2B.copyWith(color: Colors.white)),
      //     ),
      //   ),
      // ),
    );
  }
}
