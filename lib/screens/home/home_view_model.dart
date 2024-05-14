import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/models/category.dart';
import 'package:immersion_kwangsang/models/menu.dart';
import 'package:immersion_kwangsang/models/store.dart';
import 'package:immersion_kwangsang/services/admin_service.dart';
import 'package:immersion_kwangsang/services/home_service.dart';

enum Order {
  last("최신순"),
  distance("거리순"),
  name("이름순");

  const Order(this.str);
  final String str;
}

class HomeViewModel with ChangeNotifier {
  final HomeService _service = HomeService();
  final AdminService _adminService = AdminService();

  bool _isLoading = true;
  bool _isDisposed = false;

  List<Category>? _categories;
  List<Tab>? _tabs;
  List<StoreHome?> _maxDiscountStores = [];
  List<List<Menu>> _discountMenus = [];

  HomeViewModel() {
    init();
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  Order _order = Order.values.first;

  bool get isLoading => _isLoading;
  List<Category>? get categories => _categories;
  List<Widget>? get tabs => _tabs;
  List<StoreHome?> get maxDiscountStores => _maxDiscountStores;
  List<List<Menu>> get discountMenus => _discountMenus;
  Order get order => _order;

  Future<void> init() async {
    _isLoading = true;
    await getStoreCategories();
    await getMaxDiscountStores();
    await getDiscountMenus();
    _isLoading = false;
    if (!_isDisposed) {
      notifyListeners();
    }
  }

  Future<void> refresh() async {
    await getMaxDiscountStores();
    await getDiscountMenus();
    notifyListeners();
  }

  Future<void> getStoreCategories() async {
    final temp = await _adminService.getStoreCategories();
    _categories = [Category(id: -1, name: "전체"), ...temp];
    if (!_isDisposed) {
      notifyListeners();
    }
  }

  Future<void> getMaxDiscountStores() async {
    final stores = await _service.getMaxDiscountStores();
    _maxDiscountStores = categories!
        .where((e) => e.id != -1)
        .map((e) => stores[e.name])
        .toList();
    _tabs = [...categories!.map((e) => Tab(text: e.name)).toList()];
    _maxDiscountStores = [
      getMaxDiscountStoreOfAll(_maxDiscountStores),
      ..._maxDiscountStores
    ];
    if (!_isDisposed) {
      notifyListeners();
    }
  }

  void changeOrder(Order order) async {
    _order = order;
    await getDiscountMenus();
    if (!_isDisposed) {
      notifyListeners();
    }
  }

  Future<void> getDiscountMenus() async {
    final menuMap = await _service.getDiscountMenus(_order);
    _discountMenus = _tabs!.map((e) => menuMap[e.text] ?? []).toList();
    if (!_isDisposed) {
      notifyListeners();
    }
  }
}

StoreHome? getMaxDiscountStoreOfAll(List<StoreHome?> stores) {
  StoreHome? maxDiscountStore;
  for (var store in stores) {
    if (store != null) {
      if (maxDiscountStore == null) {
        maxDiscountStore = store;
      } else {
        if (maxDiscountStore.menu.discountRate < store.menu.discountRate) {
          maxDiscountStore = store;
        }
      }
    }
  }
  return maxDiscountStore;
}
