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

  Future<List<Menu>> search(String keyword, LatLng latlng) async {
    final res = await _api.req("/search?q=$keyword", HttpMethod.post,
        body: jsonEncode({
          "lat": latlng.latitude,
          "lon": latlng.longitude,
          "range": "100000000" // 수정 - range 협의
        }),
        type: UrlType.dev); // 수정 - size 삭제
    // print(res.body); // 수정 - 삭제
    if (res.statusCode == 201) {
      return (jsonDecode(res.body)["data"] as List)
          .map((e) => Menu.fromJson(e))
          .toList();
    } else {
      throw Exception("Http Exception");
    }
  }
}
