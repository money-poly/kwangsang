import 'dart:convert';
import 'package:immersion_kwangsang/enums/category.dart';
import 'package:immersion_kwangsang/enums/menu_sort_option.dart';
import 'package:immersion_kwangsang/models/menu/menu_limit_stock_model.dart';
import 'package:immersion_kwangsang/models/menu/menu_listitem_model.dart';
import 'package:immersion_kwangsang/models/menu/menu_model.dart';
import 'package:immersion_kwangsang/models/menu/menu_new_product_model.dart';
import 'package:immersion_kwangsang/models/store/store_home_model.dart';
import 'package:immersion_kwangsang/providers/position_provider.dart';
import 'package:immersion_kwangsang/screens/home/home_view_model.dart';
import 'package:immersion_kwangsang/services/api.dart';

class HomeService {
  final API _api = API();
  final position = PositionProvider.instance.myPosition;

  Future<Map<String, StoreHome?>> getMaxDiscountStores() async {
    final res = await _api.req(
      "/menus/max-discount?lat=${position.latitude}&lon=${position.longitude}",
      HttpMethod.get,
      type: UrlType.dev,
    );
    if (res.statusCode != 200) {
      throw Exception("Failed to load max discount stores");
    } else {
      Map<String, StoreHome?> stores = {};
      for (var e in (jsonDecode(res.body)["data"] as List)) {
        String category = e["category"];
        StoreHome? store = StoreHome.fromJson(e["store"]).copyWith(
          category: category,
        );
        stores[category] = store;
      }
      return stores;
    }
  }

  Future<Map<String, List<Menu>>> getDiscountMenus(Order order) async {
    final res = await _api.req(
      "/menus/discounted?type=${order.name}&lat=${position.latitude}&lon=${position.longitude}",
      HttpMethod.get,
      type: UrlType.dev,
    );
    if (res.statusCode != 200) {
      throw Exception("Failed to load discount menus");
    } else {
      Map<String, List<Menu>> menuMap = {};
      for (var e in (jsonDecode(res.body)["data"] as List)) {
        String category = e["category"];
        List<Menu> menus = (e["menus"] as List)
            .map((e) => Menu.fromJson(e))
            .toList()
            .cast<Menu>();
        menuMap[category] = menus;
      }
      return menuMap;
    }
  }
  
  Future<List<MenuNewProductModel>> getMenusUpcomingSales() async {
    // Build RestAPI uri
    var uri = "/menus2/upcoming-sales";
    uri += "?lat=${position.latitude}&lon=${position.longitude}";
    
    // API call and get response
    var res = await _api.req(
      uri,
      HttpMethod.get,
      type: UrlType.dev,
    );

    // Check success
    if (res.statusCode != 200) {
      throw Exception("Failed to get MenusTopOrders");
    }

    var resData = jsonDecode(res.body);
    if (!resData['success']) {
      throw Exception(resData['message']);
    }

    // Parse data
    var resModel = (resData['data'] as List<dynamic>)
        .map((saleList) => MenuNewProductModel.fromJson(saleList))
        .toList();

    return resModel;
  }


  Future<List<MenuListItemModel>> getMenusLastItem({
    required bool getAll,
  }) async {
    // Build RestAPI uri
    var uri = "/menus2/last-item?final=$getAll";
    uri += "&lat=${position.latitude}&lon=${position.longitude}";

    // API call and get response
    var res = await _api.req(
      uri,
      HttpMethod.get,
      type: UrlType.dev,
    );

    // Check success
    if (res.statusCode != 200) {
      throw Exception("Failed to get MenusLastItem");
    }

    var resData = jsonDecode(res.body);
    if (!resData['success']) {
      throw Exception(resData['message']);
    }

    // Parse data
    var resModel = (resData['data']['menus'] as List<dynamic>)
        .map((menuListItem) => MenuListItemModel.fromJson(menuListItem))
        .toList();

    return resModel;
  }

  Future<MenuLimitStockModel> getMenusLowStock({
    required EMenuSortOption sortType,
    required ECategory category,
    int? lastId,
    int? lastValue,
  }) async {
    // Build RestAPI uri
    var uri = "/menus2/low-stock?type=${sortType.key}&category=${category.key}";
    if (lastId != null) {
      uri += "&lastId=$lastId";
    }
    if (lastValue != null) {
      uri += "&lastValue=$lastValue";
    }
    uri += "&lat=${position.latitude}&lon=${position.longitude}";

    // // API call and get response
    var res = await _api.req(
      uri,
      HttpMethod.get,
      type: UrlType.dev,
    );

    // Check success
    if (res.statusCode != 200) {
      throw Exception("Failed to get MenusLowStock");
    }

    var resData = jsonDecode(res.body);
    if (!resData['success']) {
      throw Exception(resData['message']);
    }

    // Parse data
    var resModel = MenuLimitStockModel.fromJson(resData['data']);

    return resModel;
  }

  Future<List<MenuListItemModel>> getMenusTopOrders({
    required EMenuSortOption sortType,
    required ECategory category,
    int? lastId,
    int? lastValue,
  }) async {
    // Build RestAPI uri
    var uri =
        "/menus2/top-orders?type=${sortType.key}&category=${category.key}";
    if (lastId != null) {
      uri += "&lastId=$lastId";
    }
    if (lastValue != null) {
      uri += "&lastValue=$lastValue";
    }
    uri += "&lat=${position.latitude}&lon=${position.longitude}";

    // // API call and get response
    var res = await _api.req(
      uri,
      HttpMethod.get,
      type: UrlType.dev,
    );

    print(res.body);

    // Check success
    if (res.statusCode != 200) {
      throw Exception("Failed to get MenusTopOrders");
    }

    var resData = jsonDecode(res.body);
    if (!resData['success']) {
      throw Exception(resData['message']);
    }

    // Parse data
    var resModel = (resData['data'] as List<dynamic>)
        .map((menuListItem) => MenuListItemModel.fromJson(menuListItem))
        .toList();

    return resModel;
  }
}
