import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:immersion_kwangsang/models/store.dart';
import 'package:immersion_kwangsang/services/map_service.dart';

class MapStoreViewModel with ChangeNotifier {
  final MapService _service = MapService();
  StoreDetail? _store;

  StoreDetail? get store => _store;

  MapStoreViewModel(LatLng latLng, int id) {
    getStoreDetail(latLng, id);
  }

  Future<void> getStoreDetail(LatLng latLng, int id) async {
    _store = await _service.getStoreDetail(latLng, id);
    notifyListeners();
  }
}
