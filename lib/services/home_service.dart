import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:immersion_kwangsang/models/menu.dart';
import 'package:immersion_kwangsang/models/store.dart';
import 'package:immersion_kwangsang/screens/home/home_view_model.dart';
import 'package:immersion_kwangsang/services/api.dart';

class HomeService {
  final API _api = API();

  Future<Map<String, StoreHome?>> getMaxDiscountStores(LatLng latLng) async {
    final res = await _api.req(
      "/menus/max-discount?lat=${latLng.latitude}&lon=${latLng.longitude}",
      HttpMethod.get,
      type: UrlType.dev,
    );
    if (res.statusCode != 200) {
      throw Exception("Failed to load max discount stores");
    } else {
      Map<String, StoreHome?> stores = {};
      for (var e in (jsonDecode(res.body)["data"] as List)) {
        String category = e["category"];
        StoreHome? store = StoreHome.fromJson(e["store"]);
        store.category = category;
        stores[category] = store;
      }
      return stores;
    }
  }

  Future<List<List<Menu>>> getDiscountMenus(Order order, LatLng latLng) async {
    final res = await _api.req(
      "/menus/discounted?type=${order.name}&lat=${latLng.latitude}&lon=${latLng.longitude}",
      HttpMethod.get,
      type: UrlType.dev,
    );
    if (res.statusCode != 200) {
      throw Exception("Failed to load discount menus");
    } else {
      print(res.body);
      final menus = (jsonDecode(res.body)["data"] as List)
          .map(
              (e) => (e["menus"] as List).map((e) => Menu.fromJson(e)).toList())
          .toList();
      return menus;
    }
  }
}
