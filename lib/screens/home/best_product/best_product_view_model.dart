import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/enums/category.dart';
import 'package:immersion_kwangsang/enums/loading_status.dart';
import 'package:immersion_kwangsang/enums/menu_sort_option.dart';
import 'package:immersion_kwangsang/models/menu/menu_listitem_model.dart';
import 'package:immersion_kwangsang/services/home_service.dart';

class BestProductViewModel with ChangeNotifier {
  late final HomeService _service;

  BestProductViewModel() {
    _service = HomeService();

    _status = ELoadingStatus.init;
    _sortType = EMenuSortOption.price;
    _category = ECategory.all;
    _items = [];
  }

  late ELoadingStatus _status;
  ELoadingStatus get status => _status;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  late EMenuSortOption _sortType;
  EMenuSortOption get currentSortType => _sortType;

  late ECategory _category;
  ECategory get currentCategory => _category;

  // Page: last items id and price(regularPrice)
  // (&lastId=$id&lastValue=$regularPrice)
  late List<MenuListItemModel> _items;
  List<MenuListItemModel> get menuItems => _items;

  void getMoreItem() async {
    _status = ELoadingStatus.loading;

    try {
      _items.addAll(await _service.getMenusTopOrders(
        sortType: _sortType,
        category: _category,
        lastId: _items.isEmpty ? null : _items.last.menu.id,
        lastValue: _items.isEmpty ? null : _items.last.menu.regularPrice,
      ));

      _status = ELoadingStatus.loaded;
    } catch (e) {
      _status = ELoadingStatus.error;
      _errorMessage = e.toString();
    } finally {
      notifyListeners();
    }
  }

  void changeCategory(ECategory category) {
    _category = category;
    notifyListeners();
  }

  void changeSortOption(EMenuSortOption sortOption) {
    _sortType = sortOption;
    notifyListeners();
  }
}
