import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:immersion_kwangsang/models/menu.dart';
import 'package:immersion_kwangsang/services/api.dart';

class DetailService {
  final API _api = API();

  Future<MenuDetail> getDetailMenu(int id, LatLng latLng) async {
    final res = await _api.req(
        "/menus/detail/$id?lat=${latLng.latitude}&lon=${latLng.longitude}",
        HttpMethod.get,
        type: UrlType.dev);
    if (res.statusCode != 200) {
      throw Exception("Failed to load detail menu");
    } else {
      return MenuDetail.fromJson(jsonDecode(res.body)["data"]);
    }
  }
}
