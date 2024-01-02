import 'dart:convert';
import 'package:immersion_kwangsang/models/category.dart';
import 'package:immersion_kwangsang/services/api.dart';

class AdminService {
  final _api = API();

  Future<List<Category>> getStoreCategories() async {
    final res =
        await _api.req("/categories/sub/1", HttpMethod.get, type: UrlType.dev);
    if (res.statusCode != 200) {
      throw Exception("Failed to load categories");
    } else {
      return (jsonDecode(res.body)["data"]["subs"] as List)
          .map((e) => Category.fromJson(e))
          .toList();
    }
  }
}
