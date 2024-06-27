import 'dart:convert';
import 'package:immersion_kwangsang/models/menu/menu_model.dart';
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
}
