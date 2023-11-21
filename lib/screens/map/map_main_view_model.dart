import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapMainViewModel with ChangeNotifier {
  late final GoogleMapController _mapController;

  void initController(controller) {
    _mapController = controller;
    notifyListeners();
  }
  
  void moveCameraInitPosition(LatLng latLng) {
    _mapController.animateCamera(CameraUpdate.newLatLng(latLng));
  }
}