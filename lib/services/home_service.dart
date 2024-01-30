import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:immersion_kwangsang/models/menu.dart';
import 'package:immersion_kwangsang/models/store.dart';
import 'package:immersion_kwangsang/providers/position_provider.dart';
import 'package:immersion_kwangsang/screens/home/home_view_model.dart';
import 'package:immersion_kwangsang/services/api.dart';
import 'package:provider/provider.dart';

class HomeService {
  final API _api = API();
  late final PositionProvider _positionProvider;

  HomeService(BuildContext context) {
    _positionProvider = Provider.of<PositionProvider>(context, listen: false);
  }

  Future<void> initPosition() async {
    await _positionProvider.initMyPosition();
  }

  Future<Map<String, StoreHome?>> getMaxDiscountStores() async {
    final res = await _api.req(
      "/menus/max-discount?lat=${_positionProvider.myPosition!.latitude}&lon=${_positionProvider.myPosition!.longitude}",
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

  Future<List<List<Menu>>> getDiscountMenus(Order order) async {
    final res = await _api.req(
      "/menus/discounted?type=${order.name}&lat=${_positionProvider.myPosition!.latitude}&lon=${_positionProvider.myPosition!.longitude}",
      HttpMethod.get,
      type: UrlType.dev,
    );
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
