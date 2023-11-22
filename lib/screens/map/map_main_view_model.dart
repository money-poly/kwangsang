import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:immersion_kwangsang/models/store.dart';

class MapMainViewModel with ChangeNotifier {
  late final GoogleMapController _mapController;
  BitmapDescriptor _markerOffIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor _markerOnIcon = BitmapDescriptor.defaultMarker;
  int? selectedMarkerId;
  List<Marker> _markers = [];

  List<Marker> get markers => _markers;

  MapMainViewModel() {
    initMarkerIcon();
  }

  void initController(controller) {
    _mapController = controller;
    notifyListeners();
  }

  void moveCameraInitPosition(LatLng latLng) {
    _mapController.animateCamera(CameraUpdate.newLatLng(latLng));
  }

  void initMarkerIcon() async {
    await BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(30, 35)), "assets/imgs/img_30_marker_offorigin.png")
        .then((value) => _markerOffIcon = value);
    await BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(50, 58)), "assets/imgs/img_50_marker_onorigin.png")
        .then((value) => _markerOnIcon = value);
    getMarkers();
    notifyListeners();
  }

  Future<void> getMarkers() async {
    final List<StoreSimple> simpleStores = [
      StoreSimple(id: 1, name: "누구나 반한 닭", latLng: LatLng(37.5052, 127.0478)),
      StoreSimple(id: 2, name: "이디야 커피", latLng: LatLng(37.5039, 127.0482)),
      StoreSimple(id: 3, name: "바나프레소", latLng: LatLng(37.5046, 127.0482))
    ];

    _markers = simpleStores
        .map((e) => Marker(
            markerId: MarkerId(e.id.toString()),
            position: e.latLng,
            onTap: () {
              selectedMarkerId = e.id;
              updateMarker(e.id);
            },
            icon: selectedMarkerId == e.id ? _markerOnIcon : _markerOffIcon))
        .toList();
    notifyListeners();
  }

  Future<void> updateMarker(markerId) async {
    _markers = _markers
        .map((e) => Marker(
            markerId: e.markerId,
            position: e.position,
            onTap: e.onTap,
            icon: markerId == int.parse(e.markerId.value)
                ? _markerOnIcon
                : _markerOffIcon))
        .toList();
    notifyListeners();
  }
}
