import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/enums/loading_status.dart';
import 'package:immersion_kwangsang/models/menu/menu_new_product_model.dart';
import 'package:immersion_kwangsang/services/home_service.dart';

class NewProductViewModel with ChangeNotifier {
  late final HomeService _service;

  NewProductViewModel() {
    _service = HomeService();

    _status = ELoadingStatus.init;
    _newProducts = const [];

    getNewProducts();
  }

  late ELoadingStatus _status;
  ELoadingStatus get status => _status;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  late List<MenuNewProductModel> _newProducts;
  List<MenuNewProductModel> get newProducts => _newProducts;

  void getNewProducts() async {
    if (_status == ELoadingStatus.loading) return;

    _status = ELoadingStatus.loading;
    notifyListeners();

    try {
      var newItems = await _service.getMenusUpcomingSales();

      _newProducts = newItems;
      _status = ELoadingStatus.done;
    } catch (e) {
      _status = ELoadingStatus.error;
      _errorMessage = e.toString();
    } finally {
      notifyListeners();
    }
  }
}
