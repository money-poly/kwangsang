import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:immersion_kwangsang/enums/category.dart';
import 'package:immersion_kwangsang/enums/loading_status.dart';
import 'package:immersion_kwangsang/enums/menu_sort_option.dart';
import 'package:immersion_kwangsang/models/menu/menu_listitem_model.dart';
import 'package:immersion_kwangsang/services/home_service.dart';

class BestProductViewModel with ChangeNotifier {
  late final HomeService _service;

  BestProductViewModel() {
    _service = HomeService();

    _controller = ScrollController();
    _status = ELoadingStatus.init;
    _sortType = EMenuSortOption.price;
    _category = ECategory.all;
    _items = [];
    _lastUpdateTime = DateTime.now();
  }

  late final ScrollController _controller;
  ScrollController get scrollController => _controller;

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

  late DateTime _lastUpdateTime;
  DateTime get lastUpdateTime => _lastUpdateTime;

  void getMoreItem() async {
    if (_status == ELoadingStatus.loading) return;

    _status = ELoadingStatus.loading;
    notifyListeners();

    try {
      var newItems = await _service.getMenusTopOrders(
        sortType: _sortType,
        category: _category,
        lastId: _items.isEmpty ? null : _items.last.menu.id,
        lastValue: _items.isEmpty ? null : _items.last.menu.regularPrice,
      );

      if (newItems.isEmpty) {
        _status = ELoadingStatus.done;
      } else {
        _items.addAll(newItems);
        _status = ELoadingStatus.loaded;
      }
    } catch (e) {
      _status = ELoadingStatus.error;
      _errorMessage = e.toString();
      _controller.animateTo(
        _controller.position.maxScrollExtent + (_items.length > 5 ? 160 : 0),
        duration: Durations.short4,
        curve: Curves.ease,
      );
    } finally {
      _lastUpdateTime = DateTime.now();
      notifyListeners();
    }
  }

  void changeCategory(ECategory category) {
    if (_status == ELoadingStatus.loading) return;

    _category = category;
    _items = [];
    _status = ELoadingStatus.init;
    getMoreItem();
  }

  void changeSortOption(EMenuSortOption sortOption) {
    if (_status == ELoadingStatus.loading) return;

    _sortType = sortOption;
    _items = [];
    _status = ELoadingStatus.init;
    getMoreItem();
  }
}
