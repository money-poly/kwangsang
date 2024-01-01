import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:immersion_kwangsang/models/menu.dart';
import 'package:immersion_kwangsang/models/origin.dart';
import 'package:immersion_kwangsang/models/tag.dart';

class StoreSimple {
  int id;
  String name;
  LatLng latLng;

  StoreSimple({required this.id, required this.name, required this.latLng});

  factory StoreSimple.fromJson(Map<String, dynamic> json) => StoreSimple(
        id: json['id'],
        name: json['name'],
        latLng: LatLng(
          json['lat'],
          json['lon'],
        ),
      );
}

class Store {
  String name;
  MenuSimple maxDiscountMenu;
  String? description;
  String? category;
  List<Tag>? tags;
  String? imgUrl;

  Store(
      {required this.name,
      required this.imgUrl,
      required this.maxDiscountMenu,
      this.description,
      this.tags,
      this.category});

  factory Store.fromStoreJson(Map<String, dynamic> json) => Store(
      name: json['name'],
      maxDiscountMenu: MenuSimple(discountRate: int.parse(json['maxDiscount'])),
      /* Optional */
      imgUrl: json['imgUrl'],
      description: json['description'],
      category: json['category'],
      tags: json['tags']);

  factory Store.fromJson(Map<String, dynamic> json) => Store(
      name: json['storeName'],
      maxDiscountMenu: MenuSimple.fromJson(json['menu']),
      /* Optional */
      imgUrl: json['storePictureUrl'],
      description: json['description'],
      category: json['category'],
      tags: json['tags']);
}

class StoreDetail {
  int id;
  String name;
  List<String> categories;
  String address; // address + addressDetail
  LatLng latLng;
  String pickUpTime;
  String openTime;
  String closeTime;
  List<Menu> menu;
  List<String> notes;
  List<Origin> origins;
  /* Optional */
  String? phone;
  String? imgUrl;

  StoreDetail({
    required this.id,
    required this.name,
    required this.categories,
    required this.address,
    required this.latLng,
    required this.pickUpTime,
    required this.openTime,
    required this.closeTime,
    required this.menu,
    required this.notes,
    required this.origins,
    this.phone,
    this.imgUrl,
  });

  factory StoreDetail.fromJson(Map<dynamic, dynamic> json) {
    final origins = (json['menus'] as List)
        .expand((e) => e['countryOfOrigin'])
        .toList()
        .map((e) => Origin.fromJson(e))
        .toList(); //.map((e) => e['countryOfOrigin']);

    return StoreDetail(
      id: json['id'],
      name: json['name'],
      categories: (json['categories'] as List)
          .map((e) => e['name'].toString())
          .toList(),
      address:
          json['detail']['address'] + " " + json['detail']['addressDetail'],
      latLng: LatLng(
        double.parse(json['detail']['lat']),
        double.parse(json['detail']['lon']),
      ),
      pickUpTime: json['detail']['pickupTime'],
      openTime: json['detail']['operationTimes']['startedAt'],
      closeTime: json['detail']['operationTimes']['endedAt'],
      menu: (json['menus'] as List).map((e) => Menu.fromStoreJson(e)).toList(),
      notes: (json['caution'] as List).map((e) => e.toString()).toList(),
      origins: origins,
      /* Optional */
      phone: json['phone'],
      imgUrl: json['storePictureUrl'],
    );
  }
}
