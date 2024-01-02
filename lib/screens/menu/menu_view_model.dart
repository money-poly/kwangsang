import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:immersion_kwangsang/models/menu.dart';
import 'package:immersion_kwangsang/services/detail_service.dart';

class MenuViewModel with ChangeNotifier {
  late final DetailService _service;
  MenuDetail? _menu;
  BitmapDescriptor? _markerOffIcon;

  MenuDetail? get menu => _menu;
  BitmapDescriptor? get markerOffIcon => _markerOffIcon;

  MenuViewModel(BuildContext context, LatLng latLng, int id) {
    _service = DetailService(context);
    initMarkerIcon();
    getDetailMenu(id, latLng);
  }

  void initMarkerIcon() async {
    await getBytesFromAsset("assets/imgs/img_30_marker_off.png", 90)
        .then((value) => _markerOffIcon = BitmapDescriptor.fromBytes(value));
    notifyListeners();
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    final data = await rootBundle.load(path);
    final codec = await instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    final frameInfo = await codec.getNextFrame();
    return (await frameInfo.image.toByteData(format: ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  Future<void> getDetailMenu(int id, LatLng latLng) async {
    _menu = await _service.getDetailMenu(id, latLng);
    notifyListeners();
  }
}
