import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/models/store.dart';
import 'package:immersion_kwangsang/providers/position_provider.dart';
import 'package:immersion_kwangsang/services/api.dart';
import 'package:provider/provider.dart';

class MapService {
  final API _api = API();
  late final PositionProvider _positionProvider;

  MapService(BuildContext context) {
    _positionProvider = context.read<PositionProvider>();
  }

  Future<List<StoreSimple>> getStores() async {
    final res = await _api.req(
      "/stores/map/location?lat=${_positionProvider.myPosition!.latitude}&lon=${_positionProvider.myPosition!.longitude}&range=1000000000",
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

  Future<StoreDetail> getStoreDetail(int id) async {
    final res = await _api.req(
        "/stores/$id?lat=${_positionProvider.myPosition!.latitude}&lon=${_positionProvider.myPosition!.longitude}",
        HttpMethod.get,
        type: UrlType.dev);
    if (res.statusCode != 200) {
      throw Exception("Failed to load store detail");
    } else {
      return StoreDetail.fromJson(jsonDecode(res.body)["data"]);
    }
  }
}
