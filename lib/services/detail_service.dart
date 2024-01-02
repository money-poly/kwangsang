import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:immersion_kwangsang/models/menu.dart';
import 'package:immersion_kwangsang/providers/position_provider.dart';
import 'package:immersion_kwangsang/services/api.dart';
import 'package:provider/provider.dart';

class DetailService {
  final API _api = API();
  late final PositionProvider _positionProvider;

  DetailService(BuildContext context) {
    _positionProvider = Provider.of<PositionProvider>(context, listen: false);
  }

  Future<MenuDetail> getDetailMenu(int id, LatLng latLng) async {
    final res = await _api.req(
        "/menus/detail/$id?lat=${_positionProvider.myPosition!.latitude}&lon=${_positionProvider.myPosition!.longitude}",
        HttpMethod.get,
        type: UrlType.dev);
    if (res.statusCode != 200) {
      throw Exception("Failed to load detail menu");
    } else {
      return MenuDetail.fromJson(jsonDecode(res.body)["data"]);
    }
  }
}
