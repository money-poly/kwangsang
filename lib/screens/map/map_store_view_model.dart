import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:immersion_kwangsang/models/store.dart';
import 'package:immersion_kwangsang/services/map_service.dart';

class MapStoreViewModel with ChangeNotifier {
  late final MapService _service;
  StoreDetail? _store;
  BitmapDescriptor? _markerOffIcon;

  StoreDetail? get store => _store;
  BitmapDescriptor? get markerOffIcon => _markerOffIcon;

  MapStoreViewModel(BuildContext context, int id) {
    _service = MapService(context);
    initMarkerIcon();
    getStoreDetail(id);
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

  Future<void> getStoreDetail(int id) async {
    _store = await _service.getStoreDetail(id);
    notifyListeners();
  }
}
