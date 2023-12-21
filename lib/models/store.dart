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
  MenuSimple maxDiscountMenu;
  String? description;
  String? category;
  List<Tag>? tags;
  String imgUrl;

  Store(
      {required this.name,
      required this.imgUrl,
      required this.maxDiscountMenu,
      this.description,
      this.tags,
      this.category});

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        name: json['storeName'],
        imgUrl: json['storeImgUrl'],
        maxDiscountMenu: MenuSimple.fromJson(json['menu']),
        /* Optional */
        description: json['description'],
        category: json['category'],
        tags: json['tags']
      );
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
