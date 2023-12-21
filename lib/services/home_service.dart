import 'dart:convert';
import 'package:immersion_kwangsang/models/store.dart';
import 'package:immersion_kwangsang/services/api.dart';

class HomeService {
  final API _api = API();

  Future<List<Map<String, Store?>>> getMaxDiscountStores() async {
    final res = await _api.req("/home/maxdiscount", HttpMethod.get);
    final stores = (jsonDecode(res.body)["data"] as List).map((e) {
      String category = e["category"];
      Store? store = e["store"] == null ? null : Store.fromJson(e["store"]);
      if (store != null) {
        store.category = category;
      }
      return {category: store};
    }).toList();
    return stores;
  }
}
