import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:immersion_kwangsang/models/menu.dart';
import 'package:immersion_kwangsang/services/api.dart';

class SearchService {
  final _api = API();

  Future<List<String>> getRecommendKeywords() async {
    final res = await _api.req("/search/keyword/recommend", HttpMethod.get,
        type: UrlType.dev);
    if (res.statusCode == 200) {
      return (jsonDecode(res.body)["data"]["keyword"] as List).cast<String>();
    } else {
      throw Exception("Http Exception");
    }
  }

  // [TODO] range 백엔드와 협의 후 수정. 현재 더미데이터를 사용하는 동안, 전체 가게를 볼 수 있도록 임의의 큰 값을 사용함
  Future<List<Menu>> search(String keyword, LatLng latlng) async {
    final res = await _api.req("/search?q=$keyword", HttpMethod.post,
        body: jsonEncode({
          "lat": latlng.latitude,
          "lon": latlng.longitude,
          "range": "100000000"
        }),
        type: UrlType.dev);
    if (res.statusCode == 201) {
      return (jsonDecode(res.body)["data"] as List)
          .map((e) => Menu.fromJson(e))
          .toList();
    } else {
      throw Exception("Http Exception");
    }
  }
}
