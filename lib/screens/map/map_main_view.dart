import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:immersion_kwangsang/providers/position_provider.dart';
import 'package:immersion_kwangsang/screens/map/map_main_view_model.dart';
import 'package:immersion_kwangsang/screens/map/widgets/map_store_card.dart';
import 'package:provider/provider.dart';

class MapMainView extends StatelessWidget {
  const MapMainView({super.key});

  @override
  Widget build(BuildContext context) {
    final positionProvider = Provider.of<PositionProvider>(context);
    final viewModel = Provider.of<MapMainViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/imgs/img_104_logo_appbar.png",
          width: 104,
          height: 46,
        ),
        toolbarHeight: 64,
        titleSpacing: 20,
        centerTitle: false,
        actions: [
          GestureDetector(
            onTap: () => context.push("/search"),
            child: SvgPicture.asset(
              "assets/icons/ic_36_search.svg",
              width: 36,
              height: 36,
            ),
          ),
          const SizedBox(width: 20)
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
                target: LatLng(positionProvider.myPosition.latitude,
                    positionProvider.myPosition.longitude),
                zoom: 16),
            onMapCreated: (controller) => viewModel.initController(controller),
            myLocationEnabled: true,
            compassEnabled: true,
            mapToolbarEnabled: true,
            rotateGesturesEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            tiltGesturesEnabled: false,
            markers: viewModel.markers.toSet(),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () async {
                      await positionProvider.updateMyPosition();
                      viewModel.moveCameraInitPosition();
                    },
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                      width: 48,
                      height: 48,
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.2),
                            blurRadius: 4,
                            offset: Offset(0, 0),
                          )
                        ],
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/ic_28_location.svg",
                        width: 28,
                        height: 28,
                      ),
                    ),
                  ),
                  if (viewModel.store != null)
                    GestureDetector(
                      onTap: () => context.push("/storeDetail",
                          extra: viewModel.selectedMarkerId),
                      child: MapStoreCard(store: viewModel.store!),
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
