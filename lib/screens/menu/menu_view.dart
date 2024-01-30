import 'package:extended_image/extended_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:immersion_kwangsang/providers/position_provider.dart';
import 'package:immersion_kwangsang/screens/map/widgets/store_info_row.dart';
import 'package:immersion_kwangsang/screens/menu/menu_view_model.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/utils/origin_formatter.dart';
import 'package:immersion_kwangsang/widgets/bullet_string.dart';
import 'package:immersion_kwangsang/widgets/custom_alert_dialog.dart';
import 'package:immersion_kwangsang/widgets/menu_card.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MenuViewModel>(context);
    final positionProvider = Provider.of<PositionProvider>(context);
    return Scaffold(
      backgroundColor: KwangColor.grey100,
      appBar: AppBar(
        title: Text("상품상세", style: KwangStyle.header2),
        toolbarHeight: 64,
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
          : SingleChildScrollView(
              child: Column(
                children: [
                  if (viewModel.menu!.menuPictureUrl != null)
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 244,
                      child: ExtendedImage.network(
                          viewModel.menu!.menuPictureUrl!,
                          fit: BoxFit.cover),
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
                            Text(
                              viewModel.menu!.description,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: KwangColor.grey600),
                            ),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "가격",
                                  style: KwangStyle.header1,
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
                      Container(
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
                                content: viewModel.menu!.storeName,
                                hasPaddingBottom: true),
                            StoreInfoRow(
                                title: "매장주소",
                                content: viewModel.menu!.storeAddress,
                                hasPaddingBottom: true),
                            StoreInfoRow(
                                title: "픽업시간",
                                content: "${viewModel.menu!.pickUpTime}분",
                                hasPaddingBottom: true),
                            StoreInfoRow(
                                title: "전화번호",
                                content: viewModel.menu!.phone,
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
                              target: viewModel.menu!.location,
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
                                position: viewModel.menu!.location,
                                icon: viewModel.markerOffIcon!,
                              )
                            }),
                      ),
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
                              vertical: 16, horizontal: 20),
                          child: Wrap(
                            direction: Axis.vertical,
                            spacing: 20,
                            children: viewModel.menu!.anotherMenus
                                .map(
                                  (e) => GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ChangeNotifierProvider(
                                            create: (_) => MenuViewModel(
                                                context,
                                                LatLng(
                                                    positionProvider
                                                        .myPosition!.latitude,
                                                    positionProvider
                                                        .myPosition!.longitude),
                                                e.id),
                                            child: const MenuView(),
                                          ),
                                        ),
                                      );
                                    },
                                    child: MenuCard(
                                        menu: e, type: MenuCardType.horizontal),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
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
                        margin: const EdgeInsets.only(bottom: 4),
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
                            bottom: MediaQuery.of(context).viewPadding.bottom +
                                102),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: viewModel.menu!.cautions
                              .map((e) => BulletString(
                                    txt: e,
                                    style: KwangStyle.body2,
                                    hasBottomPadding:
                                        viewModel.menu!.cautions.indexOf(e) !=
                                            viewModel.menu!.cautions.length - 1,
                                  ))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
      bottomSheet: Container(
        padding: EdgeInsets.fromLTRB(
            20, 11, 20, 11 + MediaQuery.of(context).viewPadding.bottom),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(width: 1.0, color: KwangColor.grey300),
          ),
        ),
        child: GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) =>
                    const CustomAlertDialog(type: AlertType.developing));
          },
          child: Container(
            height: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: KwangColor.primary400,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text("전화하기",
                style: KwangStyle.btn2B.copyWith(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
