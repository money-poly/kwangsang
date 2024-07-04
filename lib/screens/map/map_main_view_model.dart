import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:immersion_kwangsang/models/store/store_model.dart';
import 'package:immersion_kwangsang/models/store/store_simple.dart';
import 'package:immersion_kwangsang/providers/position_provider.dart';
import 'package:immersion_kwangsang/services/map_service.dart';

class MapMainViewModel with ChangeNotifier {
  final MapService _service = MapService();
  bool _isDisposed = false;

  GoogleMapController? _mapController;
  final BitmapDescriptor _markerOffIcon =
      PositionProvider.instance.markerOffIcon;
  final BitmapDescriptor _markerOnIcon = PositionProvider.instance.markerOnIcon;
  int? selectedMarkerId;
  List<Marker> _markers = [];
  Store? _store;

  List<Marker> get markers => _markers;
  Store? get store => _store;

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  void initController(GoogleMapController controller) {
    if (_mapController != null) {
      return;
    }
    _mapController = controller;
    getMarkers();
    if (!_isDisposed) {
      notifyListeners();
    }
  }

  void moveCameraInitPosition() {
    _mapController!.animateCamera(CameraUpdate.newLatLng(
        LatLng(_service.position.latitude, _service.position.longitude)));
  }

  Future<void> getMarkers() async {
    final List<StoreSimple> stores = await _service.getStores();

    _markers = stores
        .map((e) => Marker(
            markerId: MarkerId(e.id.toString()),
            position: e.latLng,
            onTap: () async {
              selectedMarkerId = e.id;
              await updateMarker(e.id);
            },
            icon: selectedMarkerId == e.id ? _markerOffIcon : _markerOffIcon))
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
