import 'dart:convert';
import 'package:immersion_kwangsang/models/store.dart';
import 'package:immersion_kwangsang/providers/position_provider.dart';
import 'package:immersion_kwangsang/services/api.dart';

class MapService {
  final _api = API();
  final position = PositionProvider.instance.myPosition;

  // [TODO] range 백엔드와 협의 후 수정. 현재 더미데이터를 사용하는 동안, 전체 가게를 볼 수 있도록 임의의 큰 값을 사용함
  Future<List<StoreSimple>> getStores() async {
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

  Future<StoreDetail> getStoreDetail(int id) async {
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
