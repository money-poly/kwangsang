import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:immersion_kwangsang/models/store.dart';
import 'package:immersion_kwangsang/providers/position_provider.dart';
import 'package:immersion_kwangsang/services/map_service.dart';
import 'package:provider/provider.dart';

class MapMainViewModel with ChangeNotifier {
  late final PositionProvider _positionProvider;

  late final GoogleMapController _mapController;
  BitmapDescriptor _markerOffIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor _markerOnIcon = BitmapDescriptor.defaultMarker;
  int? selectedMarkerId;
  List<Marker> _markers = [];
  Store? _store;

  List<Marker> get markers => _markers;
  Store? get store => _store;

  MapMainViewModel(BuildContext context) {
    _positionProvider = Provider.of<PositionProvider>(context, listen: false);
    initMarkerIcon();
  }

  void initController(controller) {
    _mapController = controller;
    getMarkers();
    notifyListeners();
  }

  void moveCameraInitPosition(LatLng latLng) {
    _mapController.animateCamera(CameraUpdate.newLatLng(latLng));
  }

  void initMarkerIcon() async {
    await getBytesFromAsset("assets/imgs/img_30_marker_off.png", 90)
        .then((value) => _markerOffIcon = BitmapDescriptor.fromBytes(value));
    await getBytesFromAsset("assets/imgs/img_50_marker_on.png", 150)
        .then((value) => _markerOnIcon = BitmapDescriptor.fromBytes(value));
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
