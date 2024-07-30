import 'dart:convert';
import 'package:immersion_kwangsang/enums/category.dart';
import 'package:immersion_kwangsang/enums/menu_sort_option.dart';
import 'package:immersion_kwangsang/models/menu/menu_listitem_model.dart';
import 'package:immersion_kwangsang/models/menu/menu_model.dart';
import 'package:immersion_kwangsang/models/store/store_home_model.dart';
import 'package:immersion_kwangsang/models/store/store_model.dart';
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

  Future<List<MenuListItemModel>> getMenusTopOrders({
    required EMenuSortOption sortType,
    required ECategory category,
    int? lastId,
    int? lastValue,
  }) async {
    // Build RestAPI uri
    var uri = "/menus/top-orders?type=${sortType.key}&category=${category.key}";
    if (lastId != null) {
      uri += "&lastId=$lastId";
    }
    if (lastValue != null) {
      uri += "&lastValue=$lastValue";
    }
    uri += "&lat=${position.latitude}&lon=${position.longitude}";

    // TODO: Connect API (remove mock code)
    // // API call and get response
    // var res = await _api.req(
    //   uri,
    //   HttpMethod.get,
    //   type: UrlType.dev,
    // );

    // // Check success
    // if (res.statusCode != 200) {
    //   throw Exception("Failed to get MenusTopOrders");
    // }

    // var resData = jsonDecode(res.body);
    // if (!resData['success']) {
    //   throw Exception(resData['message']);
    // }

    // // Parse data
    // var resModel = (resData['data'] as List<dynamic>)
    //     .map((menuListItem) => MenuListItemModel.fromJson(menuListItem))
    //     .toList();

    /** MOCK CODE START */
    print('[HomeService / GET] $uri');
    await Future.delayed(const Duration(seconds: 1));

    // throw Exception('Unexpected custom error');

    var resModel = [
      for (var i in List.generate(
          lastId == null ? 6 : 20, (idx) => (lastId ?? 0) + idx + 1))
        MenuListItemModel(
          menu: Menu(
            id: i,
            name: 'Menu $i',
            discountRate: (i * 10) % 100,
            discountPrice: i * 1000,
            imgUrl: i % 2 == 0
                ? null
                : "https://image.idus.com/image/files/8a8f31577e754c079c372824a103b2a9_512.jpg",
            regularPrice: (i + 1) * 1000,
            count: i,
            view: i,
          ),
          store: Store(
            id: i,
            name: 'Store $i',
          ),
        ),
    ];
    /** MOCK CODE END */

    return resModel;
  }
}
