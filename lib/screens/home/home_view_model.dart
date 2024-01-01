import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:immersion_kwangsang/models/category.dart';
import 'package:immersion_kwangsang/models/menu.dart';
import 'package:immersion_kwangsang/models/store.dart';
import 'package:immersion_kwangsang/providers/position_provider.dart';
import 'package:immersion_kwangsang/services/admin_service.dart';
import 'package:immersion_kwangsang/services/home_service.dart';
import 'package:provider/provider.dart';

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
  late PositionProvider _positionProvider;

  bool _isLoading = true;
  List<Category>? _categories;
  List<Tab>? _tabs;
  List<StoreHome?> _maxDiscountStores = [];
  List<List<Menu>> _discountMenus = [];

  HomeViewModel(BuildContext context) {
    _positionProvider = Provider.of<PositionProvider>(context, listen: false);
    init();
  }

  Order _order = Order.values.first;

  bool get isLoading => _isLoading;
  List<Category>? get categories => _categories;
  List<Widget>? get tabs => _tabs;
  List<StoreHome?> get maxDiscountStores => _maxDiscountStores;
  List<List<Menu>> get discountMenus => _discountMenus;
  Order get order => _order;

  Future<void> init() async {
    await getStoreCategories();
    await getMaxDiscountStores();
    await getDiscountMenus();
  }

  Future<void> getStoreCategories() async {
    _categories = await _adminService.getStoreCategories();
  }

  Future<void> getMaxDiscountStores() async {
    final stores = await _service.getMaxDiscountStores(LatLng(
        _positionProvider.myPosition!.latitude,
        _positionProvider.myPosition!.longitude));

    _maxDiscountStores = categories!.map((e) => stores[e.name]).toList();
    _tabs = [
      const Tab(text: "전체"),
      ...categories!.map((e) => Tab(text: e.name)).toList()
    ];
    _maxDiscountStores = [
      getMaxDiscountStoreOfAll(_maxDiscountStores),
      ..._maxDiscountStores
    ];
    notifyListeners();
  }

  void changeOrder(Order order) async {
    _order = order;
    await getDiscountMenus();
    notifyListeners();
  }

  Future<void> getDiscountMenus() async {
    _discountMenus = await _service.getDiscountMenus(
        _order,
        LatLng(_positionProvider.myPosition!.latitude,
            _positionProvider.myPosition!.longitude));
    _isLoading = false;
    notifyListeners();
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
