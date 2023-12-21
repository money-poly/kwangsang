import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:immersion_kwangsang/models/menu.dart';
import 'package:immersion_kwangsang/models/store.dart';
import 'package:immersion_kwangsang/models/tag.dart';

class MapMainViewModel with ChangeNotifier {
  late final GoogleMapController _mapController;
  BitmapDescriptor _markerOffIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor _markerOnIcon = BitmapDescriptor.defaultMarker;
  int? selectedMarkerId;
  List<Marker> _markers = [];
  Store? _store;

  List<Marker> get markers => _markers;
  Store? get store => _store;

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
            const ImageConfiguration(size: Size(30, 35)),
            "assets/imgs/img_30_marker_offorigin.png")
        .then((value) => _markerOffIcon = value);
    await BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(50, 58)),
            "assets/imgs/img_50_marker_onorigin.png")
        .then((value) => _markerOnIcon = value);
    getMarkers();
    notifyListeners();
  }

  Future<void> getMarkers() async {
    final List<StoreSimple> tempStores = [
      StoreSimple(id: 1, name: "누구나 반한 닭", latLng: LatLng(37.5052, 127.0478)),
      StoreSimple(id: 2, name: "이디야 커피", latLng: LatLng(37.5039, 127.0482)),
      StoreSimple(id: 3, name: "바나프레소", latLng: LatLng(37.5046, 127.0482))
    ];

    _markers = tempStores
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
    await getStoreCard();
    notifyListeners();
  }

  Future<void> getStoreCard() async {
    final tempStore = Store(
        name: "누구나 반한 닭$selectedMarkerId",
        description: "누구나 반한 닭은 누구나 반한 닭이다.",
        maxDiscountMenu: MenuSimple(id: 1, discountRate: 30),
        tags: [
          tagMapping["마감할인"]!,
        ],
        imgUrl:
            "https://i.namu.wiki/i/aN7eMJzy4XAy1yqpL3kHb41MBsSdfPjt1ZqMfDXYk6J3-je6M8dNVOMldpbxhZ-IlO9IfHXMzpZc1tVvat5IjQ.webp");
    _store = tempStore;
    notifyListeners();
  }
}
