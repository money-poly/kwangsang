import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:immersion_kwangsang/models/store.dart';
import 'package:immersion_kwangsang/services/map_service.dart';

class MapMainViewModel with ChangeNotifier {
  final MapService _service = MapService();
  bool _isDisposed = false;

  GoogleMapController? _mapController;
  BitmapDescriptor _markerOffIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor _markerOnIcon = BitmapDescriptor.defaultMarker;
  int? selectedMarkerId;
  List<Marker> _markers = [];
  Store? _store;

  List<Marker> get markers => _markers;
  Store? get store => _store;

  MapMainViewModel(BuildContext context) {
    initMarkerIcon();
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  void initController(GoogleMapController controller, LatLng position) {
    if (_mapController != null) {
      return;
    }
    _mapController = controller;
    getMarkers(position);
    if (!_isDisposed) {
      notifyListeners();
    }
  }

  void moveCameraInitPosition(LatLng latLng) {
    _mapController!.animateCamera(CameraUpdate.newLatLng(latLng));
  }

  void initMarkerIcon() async {
    await getBytesFromAsset("assets/imgs/img_30_marker_off.png", 90)
        .then((value) => _markerOffIcon = BitmapDescriptor.fromBytes(value));
    await getBytesFromAsset("assets/imgs/img_50_marker_on.png", 150)
        .then((value) => _markerOnIcon = BitmapDescriptor.fromBytes(value));
    if (!_isDisposed) {
      notifyListeners();
    }
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

  Future<void> getMarkers(LatLng position) async {
    final List<StoreSimple> stores = await _service.getStores(position);

    _markers = stores
        .map((e) => Marker(
            markerId: MarkerId(e.id.toString()),
            position: e.latLng,
            onTap: () async {
              selectedMarkerId = e.id;
              await updateMarker(e.id);
            },
            icon: selectedMarkerId == e.id ? _markerOnIcon : _markerOffIcon))
        .toList();
    if (!_isDisposed) {
      notifyListeners();
    }
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
    if (!_isDisposed) {
      notifyListeners();
    }
  }

  Future<void> getStoreCard() async {
    _store = await _service.getStore(selectedMarkerId!);
    if (!_isDisposed) {
      notifyListeners();
    }
  }
}
