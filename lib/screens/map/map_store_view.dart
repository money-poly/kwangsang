import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:immersion_kwangsang/screens/map/map_store_view_model.dart';
import 'package:immersion_kwangsang/screens/map/widgets/store_info_row.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/widgets/bullet_string.dart';
import 'package:immersion_kwangsang/widgets/menu_card.dart';
import 'package:provider/provider.dart';

class MapStoreView extends StatelessWidget {
  const MapStoreView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MapStoreViewModel>(context);
    if (viewModel.store == null) {
      return const Center(
        child: CircularProgressIndicator(
          color: KwangColor.primary400,
        ),
      );
    } else {
      return Scaffold(
          backgroundColor: KwangColor.grey100,
          appBar: AppBar(
            title: Text(viewModel.store!.name, style: KwangStyle.header2),
            toolbarHeight: 64,
            titleSpacing: 8,
            centerTitle: false,
            leading: Padding(
              padding: const EdgeInsets.only(left: 20),
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
            leadingWidth: 56,
            actions: [
              SvgPicture.asset(
                "assets/icons/ic_36_close.svg",
                width: 36,
                height: 36,
              ),
              const SizedBox(width: 20)
            ],
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 244,
                child: ExtendedImage.network(viewModel.store!.imgUrl,
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
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: KwangColor.lightRed,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            viewModel.store!.dday,
                            style:
                                KwangStyle.btn3.copyWith(color: KwangColor.red),
                          ),
                        ),
                        Text(
                          viewModel.store!.category,
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: KwangColor.grey600),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          viewModel.store!.name,
                          style: KwangStyle.header1,
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
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
                            title: "매장",
                            content: viewModel.store!.address,
                            hasPaddingBottom: true),
                        StoreInfoRow(
                            title: "영업시간",
                            content:
                                "${viewModel.store!.openTime} ~ ${viewModel.store!.closeTime}",
                            hasPaddingBottom: true),
                        StoreInfoRow(
                            title: "픽업시간",
                            content:
                                "${viewModel.store!.minPickUpTime}~${viewModel.store!.maxPickUpTime}분",
                            hasPaddingBottom: true),
                        StoreInfoRow(
                            title: "전화번호",
                            content: viewModel.store!.phoneNumber,
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
                          target: LatLng(viewModel.store!.latLng.latitude,
                              viewModel.store!.latLng.longitude),
                          zoom: 16,
                        ),
                        myLocationButtonEnabled: false,
                        zoomControlsEnabled: false,
                        markers: {
                          Marker(
                              markerId: const MarkerId("store"),
                              position: viewModel.store!.latLng)
                        }),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 8),
                    height: 4,
                    color: KwangColor.grey200,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 20),
                      child: Text("메뉴", style: KwangStyle.header2)),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 20),
                    child: Wrap(
                      direction: Axis.vertical,
                      spacing: 20,
                      children: viewModel.store!.menu
                          .map((e) =>
                              MenuCard(menu: e, type: MenuCardType.horizontal))
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
                        Text(
                          viewModel.store!.countryOrigin,
                          style: KwangStyle.body2M
                              .copyWith(color: KwangColor.grey800),
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
                        bottom: MediaQuery.of(context).viewPadding.bottom + 52),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: viewModel.store!.notes
                          .map((e) => BulletString(
                                txt: e,
                                style: KwangStyle.body2,
                                hasBottomPadding:
                                    e != viewModel.store!.notes.last,
                              ))
                          .toList(),
                    ),
                  ),
                ],
              )
            ]),
          ));
    }
  }
}