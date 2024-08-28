import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/enums/category.dart';
import 'package:immersion_kwangsang/enums/loading_status.dart';
import 'package:immersion_kwangsang/enums/menu_sort_option.dart';
import 'package:immersion_kwangsang/models/menu/menu_limit_stock_model.dart';
import 'package:immersion_kwangsang/models/menu/menu_listitem_model.dart';
import 'package:immersion_kwangsang/services/home_service.dart';

class LimitStockViewModel with ChangeNotifier {
  late final HomeService _service;

  LimitStockViewModel() {
    _service = HomeService();

    _lastStatus = ELoadingStatus.init;
    _lastMenu = const [];

    _controller = ScrollController();
    _limitStatus = ELoadingStatus.init;
    _sortType = EMenuSortOption.price;
    _category = ECategory.all;
    _limitMenu = MenuLimitStockModel(menus: const [], totalCount: 0);

    getLastItem(getAll: false);
  }

  // 마지막 찬스!
  bool _expendList = false;
  bool get expandList => _expendList;
  bool _getAllDone = false;

  late ELoadingStatus _lastStatus;
  ELoadingStatus get lastStatus => _lastStatus;
  String? _lastErrorMessage;
  String? get lastErrorMessage => _lastErrorMessage;

  late List<MenuListItemModel> _lastMenu;
  List<MenuListItemModel> get lastMenu => _lastMenu;

  // 곧 품절이에요
  late final ScrollController _controller;
  ScrollController get scrollController => _controller;

  late ELoadingStatus _limitStatus;
  ELoadingStatus get limitStatus => _limitStatus;
  String? _limitErrorMessage;
  String? get limitErrorMessage => _limitErrorMessage;

  late EMenuSortOption _sortType;
  EMenuSortOption get currentSortType => _sortType;

  late ECategory _category;
  ECategory get currentCategory => _category;

  // Page: last items id and price(regularPrice)
  // (&lastId=$id&lastValue=$regularPrice)
  late MenuLimitStockModel _limitMenu;
  MenuLimitStockModel get limitMenu => _limitMenu;

  void getLastItem({
    required bool getAll,
  }) async {
    if (_lastStatus == ELoadingStatus.loading) return;

    _expendList = getAll;
    _lastStatus = ELoadingStatus.loading;
    notifyListeners();

    try {
      var newItems = await _service.getMenusLastItem(getAll: getAll);

      if (newItems.isEmpty) {
        _lastStatus = ELoadingStatus.done;
      } else {
        _lastMenu = newItems;
        _lastStatus = ELoadingStatus.loaded;
      }
    } catch (e) {
      _lastStatus = ELoadingStatus.error;
      _lastErrorMessage = e.toString();
    } finally {
      notifyListeners();
    }
  }

  void toggleExpendList() {
    if (_lastStatus == ELoadingStatus.loading) return;

    _expendList = !_expendList;
    notifyListeners();

    if (!_getAllDone) {
      getLastItem(getAll: true);
      _getAllDone = true;
    }

    if (!_expendList) {
      _controller.animateTo(
        0,
        duration: Durations.short4,
        curve: Curves.ease,
      );
    }
  }

  void getMoreLimitItem() async {
    if (_limitStatus == ELoadingStatus.loading) return;

    _limitStatus = ELoadingStatus.loading;
    notifyListeners();

    try {
      var result = await _service.getMenusLowStock(
        sortType: _sortType,
        category: _category,
        lastId: _limitMenu.menus.isEmpty ? null : _limitMenu.menus.last.menu.id,
        lastValue: _limitMenu.menus.isEmpty
            ? null
            : _limitMenu.menus.last.menu.regularPrice,
      );

      if (result.menus.isEmpty) {
        _limitStatus = ELoadingStatus.done;
      } else {
        _limitMenu = _limitMenu.copyWith(
          totalCount: result.totalCount,
          menus: [..._limitMenu.menus, ...result.menus],
        );
        _limitStatus = ELoadingStatus.loaded;
      }
    } catch (e) {
      _limitStatus = ELoadingStatus.error;
      _limitErrorMessage = e.toString();
      _controller.animateTo(
        _controller.position.maxScrollExtent +
            (_limitMenu.menus.length > 5 ? 160 : 0),
        duration: Durations.short4,
        curve: Curves.ease,
      );
    } finally {
      notifyListeners();
    }
  }

  void changeCategory(ECategory category) {
    if (_limitStatus == ELoadingStatus.loading) return;

    _category = category;
    _limitMenu = MenuLimitStockModel(menus: const [], totalCount: 0);
    _limitStatus = ELoadingStatus.init;
    getMoreLimitItem();
  }

  void changeSortOption(EMenuSortOption sortOption) {
    if (_limitStatus == ELoadingStatus.loading) return;

    _sortType = sortOption;
    _limitMenu = MenuLimitStockModel(menus: const [], totalCount: 0);
    _limitStatus = ELoadingStatus.init;
    getMoreLimitItem();
  }
}
