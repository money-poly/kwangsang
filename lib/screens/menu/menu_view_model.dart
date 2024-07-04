import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/models/menu/menu_detail_model.dart';
import 'package:immersion_kwangsang/services/detail_service.dart';

class MenuViewModel with ChangeNotifier {
  late final DetailService _service;
  MenuDetail? _menu;

  MenuDetail? get menu => _menu;

  MenuViewModel(int id) {
    _service = DetailService();
    getDetailMenu(id);
  }

  void getDetailMenu(int id) async {
    _menu = null;
    _menu = await _service.getDetailMenu(id);
    notifyListeners();
  }
}
