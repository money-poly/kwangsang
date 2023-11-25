import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:immersion_kwangsang/models/menu.dart';
import 'package:immersion_kwangsang/models/tag.dart';

class StoreSimple {
  int id;
  String name;
  LatLng latLng;

  StoreSimple({required this.id, required this.name, required this.latLng});
}

class Store {
  String name;
  String description;
  int maxDiscountRate;
  List<Tag> tags;
  String imgUrl;

  Store(
      {required this.name,
      required this.description,
      required this.maxDiscountRate,
      required this.tags,
      required this.imgUrl});
}
