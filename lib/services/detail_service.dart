import 'dart:convert';
import 'package:immersion_kwangsang/models/menu.dart';
import 'package:immersion_kwangsang/providers/position_provider.dart';
import 'package:immersion_kwangsang/services/api.dart';

class DetailService {
  final API _api = API();
  final position = PositionProvider.instance.myPosition;

  Future<MenuDetail> getDetailMenu(int id) async {
    final res = await _api.req(
        "/menus/detail/$id?lat=${position.latitude}&lon=${position.longitude}",
        HttpMethod.get,
        type: UrlType.dev);
    if (res.statusCode != 200) {
      throw Exception("Failed to load detail menu");
    } else {
      return MenuDetail.fromJson(jsonDecode(res.body)["data"]);
    }
  }
}
