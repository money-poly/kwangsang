import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:immersion_kwangsang/screens/purchase_info/purchase_info_view_model.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:provider/provider.dart';

class PurchaseInfoMap extends StatelessWidget {
  const PurchaseInfoMap({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<PurchaseInfoViewModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          child: Text(
            viewModel.phase == EPurchaseInfoPhase.pending ||
                    viewModel.phase == EPurchaseInfoPhase.completed
                ? '가게 정보'
                : '픽업 전 다시 한번 확인하세요',
            style: KwangStyle.header2,
          ),
        ),
        const SizedBox(height: 8),
        if (viewModel.phase != EPurchaseInfoPhase.completed)
          Container(
            width: MediaQuery.of(context).size.width - 40,
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 18,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: KwangColor.grey300,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            clipBehavior: Clip.hardEdge,
            height: 132,
            // TODO: connect with viewModel
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
                // target: viewModel.menu!.store.latLng,
                target: LatLng(37.6203769557633, 127.057749200082),
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
                const Marker(
                  markerId: MarkerId("store"),
                  position: LatLng(37.6203769557633, 127.057749200082),
                  // icon: viewModel.markerOffIcon!,
                ),
              },
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'TODO: 가게 이름',
                      style: KwangStyle.btn1SB,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'TODO: 가게 주소',
                      style: KwangStyle.body2M,
                    ),
                  ],
                ),
              ),
              SvgPicture.asset(
                "assets/icons/ic_16_copy.svg",
                width: 32,
                height: 32,
                colorFilter: const ColorFilter.mode(
                  KwangColor.grey600,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
