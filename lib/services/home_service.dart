import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:immersion_kwangsang/models/menu.dart';
import 'package:immersion_kwangsang/models/store.dart';
import 'package:immersion_kwangsang/screens/home/home_view_model.dart';
import 'package:immersion_kwangsang/services/api.dart';

class HomeService {
  final API _api = API();

  Future<List<Map<String, Store?>>> getMaxDiscountStores(LatLng latLng) async {
    final res = await _api.req("/home/maxdiscount", HttpMethod.post,
        body: jsonEncode({
          "latitude": latLng.latitude,
          "longitude": latLng.longitude,
        }));
    final stores = (jsonDecode(res.body)["data"] as List).map((e) {
      String category = e["category"];
      Store? store = e["store"] == null ? null : Store.fromJson(e["store"]);
      if (store != null) {
        store.category = category;
      }
      return {category: store};
    }).toList();
    return stores;
  }

  Future<List<List<Menu>>> getDiscountMenus(Order order, LatLng latLng) async {
    final res = await _api.req("/home/discountMenus", HttpMethod.post,
        body: jsonEncode({
          "type": order.name,
          "latitude": latLng.latitude,
          "longitude": latLng.longitude,
        }));
    if (res.statusCode != 200) {
      throw Exception("Failed to load discount menus");
    } else {
      final menus = (jsonDecode(res.body)["data"] as List)
          .map(
              (e) => (e["menus"] as List).map((e) => Menu.fromJson(e)).toList())
          .toList();
      return menus;
    }
  }
}
