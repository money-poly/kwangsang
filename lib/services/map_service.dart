import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:immersion_kwangsang/models/store.dart';
import 'package:immersion_kwangsang/services/api.dart';

class MapService {
  final API _api = API();

  Future<List<StoreSimple>> getStores(LatLng position) async {
    final res = await _api.req(
      "/stores/map/location?lat=${position.latitude}&lon=${position.longitude}&range=1000000000",
      HttpMethod.get,
      type: UrlType.dev,
    );

    if (res.statusCode != 200) {
      throw Exception("Failed to load stores");
    } else {
      return (jsonDecode(res.body)["data"] as List)
          .map((e) => StoreSimple.fromJson(e))
          .toList();
    }
  }

  Future<Store> getStore(int id) async {
    final res =
        await _api.req("/stores/map/$id", HttpMethod.get, type: UrlType.dev);
    if (res.statusCode != 200) {
      throw Exception("Failed to load store");
    } else {
      return Store.fromStoreJson(jsonDecode(res.body)["data"]);
    }
  }

  Future<StoreDetail> getStoreDetail(int id, LatLng position) async {
    final res = await _api.req(
        "/stores/$id?lat=${position.latitude}&lon=${position.longitude}",
        HttpMethod.get,
        type: UrlType.dev);
    if (res.statusCode != 200) {
      throw Exception("Failed to load store detail");
    } else {
      return StoreDetail.fromJson(jsonDecode(res.body)["data"]);
    }
  }
}
