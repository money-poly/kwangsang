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
  late final HomeService _service;
  final AdminService _adminService = AdminService();

  bool _isLoading = true;
  bool _isDisposed = false;

  List<Category>? _categories;
  List<Tab>? _tabs;
  List<StoreHome?> _maxDiscountStores = [];
  List<List<Menu>> _discountMenus = [];

  HomeViewModel(BuildContext context) {
    _service = HomeService(context);
    init(context);
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

  Future<void> init(BuildContext context) async {
    _isLoading = true;
    await getStoreCategories();
    await _service.initPosition();
    await Future.wait(
      [
        getMaxDiscountStores(),
        getDiscountMenus(),
      ],
    );
    _isLoading = false;
    if (!_isDisposed) {
      notifyListeners();
    }
  }

  Future<void> getStoreCategories() async {
    _categories = await _adminService.getStoreCategories();
    if (!_isDisposed) {
      notifyListeners();
    }
  }

  Future<void> getMaxDiscountStores() async {
    final stores = await _service.getMaxDiscountStores();
    _maxDiscountStores = categories!.map((e) => stores[e.name]).toList();
    _tabs = [
      const Tab(text: "전체"),
      ...categories!.map((e) => Tab(text: e.name)).toList()
    ];
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
    _discountMenus = await _service.getDiscountMenus(_order);
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
