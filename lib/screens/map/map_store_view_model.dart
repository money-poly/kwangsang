import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/models/store/store_detail_model.dart';
import 'package:immersion_kwangsang/services/map_service.dart';

class MapStoreViewModel with ChangeNotifier {
  final MapService _service = MapService();
  bool _isDisposed = false;

  StoreDetail? _store;

  StoreDetail? get store => _store;

  MapStoreViewModel(int id) {
    getStoreDetail(id);
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
  
  Future<void> getStoreDetail(int id) async {
    _store = null;
    _store = await _service.getStoreDetail(id);
    if (!_isDisposed) {
      notifyListeners();
    }
  }
}
