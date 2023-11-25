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

class StoreDetail {
  String name;
  String category;
  String dday;
  String address;
  LatLng latLng;
  String openTime;
  String closeTime;
  int minPickUpTime;
  int maxPickUpTime;
  String phoneNumber;
  List<Menu> menu;
  String countryOrigin;
  List<String> notes;
  String imgUrl;

  StoreDetail({
    required this.name,
    required this.category,
    required this.dday,
    required this.address,
    required this.latLng,
    required this.openTime,
    required this.closeTime,
    required this.minPickUpTime,
    required this.maxPickUpTime,
    required this.phoneNumber,
    required this.menu,
    required this.countryOrigin,
    required this.notes,
    required this.imgUrl,
  });
}
