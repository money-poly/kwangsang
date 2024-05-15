import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/models/menu.dart';

class MenuBottomSheetViewModel with ChangeNotifier {
  Menu? _mainItem;
  final List<Menu> _selectedMenu = [];
  final Map<int, int> _selectedMenuQty = {};
  bool _isExpanded = false;

  MenuBottomSheetViewModel();

  Menu? get mainItem => _mainItem;
  List<Menu> get selectedMenu => _selectedMenu;
  Map<int, int> get selectedMenuQty => _selectedMenuQty;
  bool get isExpanded => _isExpanded;

  void setMainItem(Menu menu) {
    if (_mainItem != null) return;
    _mainItem = menu;
  }

  int totalCost() {
    int sum = 0;
    for (var menu in _selectedMenu) {
      sum += menu.discountPrice * (_selectedMenuQty[menu.id] ?? 0);
    }
    return sum;
  }

  void plusMenu(Menu menu) {
    if (!_selectedMenu.contains(menu)) {
      _selectedMenu.add(menu);
    }
    if (!_selectedMenuQty.containsKey(menu.id)) {
      _selectedMenuQty[menu.id] = 0;
    }
    _selectedMenuQty[menu.id] = _selectedMenuQty[menu.id]! + 1;
    notifyListeners();
  }

  void minusMenu(Menu menu) {
    if (_selectedMenuQty[menu.id] == null || _selectedMenuQty[menu.id]! <= 0) {
      return;
    }
    _selectedMenuQty[menu.id] = _selectedMenuQty[menu.id]! - 1;
    if (_selectedMenuQty[menu.id] == 0) {
      _selectedMenu.remove(menu);
    }
    notifyListeners();
  }

  void removeItem(Menu menu) {
    _selectedMenu.remove(menu);
    _selectedMenuQty[menu.id] = 0;
    if (_selectedMenu.isEmpty) {
      _isExpanded = false;
    }
    notifyListeners();
  }

  void expaned() {
    _isExpanded = true;
    notifyListeners();
  }

  void shrink() {
    _isExpanded = false;
    notifyListeners();
  }
}
