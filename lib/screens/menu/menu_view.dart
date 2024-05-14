import 'package:extended_image/extended_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:immersion_kwangsang/models/menu.dart';
import 'package:immersion_kwangsang/screens/map/widgets/store_info_row.dart';
import 'package:immersion_kwangsang/screens/menu/menu_bottom_sheet.dart';
import 'package:immersion_kwangsang/screens/menu/menu_bottom_sheet_view_model.dart';
import 'package:immersion_kwangsang/screens/menu/menu_view_model.dart';
import 'package:immersion_kwangsang/services/amplitude.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/utils/datetime_formatter.dart';
import 'package:immersion_kwangsang/utils/origin_formatter.dart';
import 'package:immersion_kwangsang/widgets/bullet_string.dart';
import 'package:immersion_kwangsang/widgets/menu_card.dart';
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
        title: Text("메뉴상세", style: KwangStyle.header2),
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
                              horizontal: 20, vertical: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (viewModel.menu!.description != null)
                                Text(
                                  viewModel.menu!.description!,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: KwangColor.grey600),
                                ),
                              if (viewModel.menu!.description != null)
                                const SizedBox(
                                  height: 4,
                                ),
                              Text(
                                viewModel.menu!.name,
                                style: KwangStyle.header1,
                                softWrap: true,
                                overflow: TextOverflow.visible,
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    NumberFormat('###,###,###,###')
                                        .format(viewModel.menu!.regularPrice)
                                        .replaceAll(' ', ','),
                                    style: KwangStyle.header1.copyWith(
                                        color: KwangColor.grey600,
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                  Row(
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
                                ],
                              )
                            ],
                          ),
                        ),
                        if (viewModel.menu!.expiredDate != null)
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                    color: KwangColor.grey300, width: 1),
                              ),
                            ),
                            child: StoreInfoRow(
                              title: "소비기한",
                              content: dateToStr(DateTimStrType.korean,
                                  viewModel.menu!.expiredDate!),
                              hasPaddingBottom: false,
                            ),
                          ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          width: MediaQuery.of(context).size.width - 40,
                          height: 1,
                          color: KwangColor.grey300,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 24),
                          child: Column(
                            children: [
                              StoreInfoRow(
                                  title: "매장이름",
                                  content: viewModel.menu!.store.name,
                                  hasPaddingBottom: true),
                              StoreInfoRow(
                                  title: "매장주소",
                                  content: viewModel.menu!.store.address,
                                  hasPaddingBottom: true,
                                  selectable: true),
                              StoreInfoRow(
                                  title: "픽업시간",
                                  content:
                                      "${viewModel.menu!.store.pickUpTime}분",
                                  hasPaddingBottom: true),
                              StoreInfoRow(
                                  title: "전화번호",
                                  content: viewModel.menu!.store.phone,
                                  hasPaddingBottom: false),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 40,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            border: Border.all(color: KwangColor.grey300),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          height: 100,
                          child: GoogleMap(
                              initialCameraPosition: CameraPosition(
                                target: viewModel.menu!.store.latLng,
                                zoom: 16,
                              ),
                              myLocationButtonEnabled: false,
                              zoomControlsEnabled: false,
                              gestureRecognizers: {
                                Factory<OneSequenceGestureRecognizer>(
                                  () => EagerGestureRecognizer(),
                                ),
                              },
                              markers: {
                                Marker(
                                  markerId: const MarkerId("store"),
                                  position: viewModel.menu!.store.latLng,
                                  icon: viewModel.markerOffIcon!,
                                )
                              }),
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
                              child: Text("이 매장 또 다른 메뉴",
                                  style: KwangStyle.header2)),
                        if (viewModel.menu!.anotherMenus.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              separatorBuilder: (context, idx) {
                                return const SizedBox(height: 20);
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
                                      "title": "이 매장 또 다른 메뉴",
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
                                child: MenuCard(
                                    menu: viewModel.menu!.anotherMenus[idx],
                                    type: MenuCardType.horizontal),
                              ),
                            ),
                          ),
                        if (viewModel.menu!.origins.isNotEmpty)
                          Container(
                            margin: const EdgeInsets.only(
                                top: 20, left: 20, right: 20),
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
