import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/models/menu.dart';
import 'package:immersion_kwangsang/models/store.dart';
import 'package:immersion_kwangsang/services/home_service.dart';

enum TabTypes {
  all("전체"),
  pakcedLunch("도시락"),
  buffet("뷔페"),
  desert("디저트"),
  sideDish("반찬"),
  fruits("과일/야채");

  const TabTypes(this.str);
  final String str;
}

enum Order {
  last("최신순"),
  distance("거리순"),
  name("이름순");

  const Order(this.str);
  final String str;
}

class HomeViewModel with ChangeNotifier {
  final HomeService _service = HomeService();

  bool _isLoading = true;
  List<Tab>? _tabs;
  List<Store?> _maxDiscountStores = [];
  List<List<Menu>> _discountMenus = [];

  HomeViewModel() {
    getMaxDiscountStores();
    getDiscountMenus();
  }

  Order _order = Order.values.first;

  bool get isLoading => _isLoading;
  List<Widget>? get tabs => _tabs;
  List<Store?> get maxDiscountStores => _maxDiscountStores;
  List<List<Menu>> get discountMenus => _discountMenus;
  Order get order => _order;

  Future<void> getMaxDiscountStores() async {
    final stores = await _service.getMaxDiscountStores();
    _tabs = stores.map((e) => Tab(text: e.keys.single)).toList();
    _tabs = [const Tab(text: "전체"), ..._tabs!];
    _maxDiscountStores = stores.map((e) => e[e.keys.single]).toList();
    _maxDiscountStores = [
      getMaxDiscountStoreOfAll(_maxDiscountStores),
      ..._maxDiscountStores
    ];
    notifyListeners();
  }

  void changeOrder(Order order) {
    _order = order;
    notifyListeners();
  }

  Future<void> getDiscountMenus() async {
    _discountMenus = await _service.getDiscountMenus();
    _isLoading = false;
    notifyListeners();
  }
}

Store? getMaxDiscountStoreOfAll(List<Store?> stores) {
  Store? maxDiscountStore;
  for (var store in stores) {
    if (store != null) {
      if (maxDiscountStore == null) {
        maxDiscountStore = store;
      } else {
        if (maxDiscountStore.maxDiscountMenu.discountRate <
            store.maxDiscountMenu.discountRate) {
          maxDiscountStore = store;
        }
      }
    }
  }
  return maxDiscountStore;
}
