import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:immersion_kwangsang/models/menu.dart';
import 'package:immersion_kwangsang/models/origin.dart';
import 'package:immersion_kwangsang/models/tag/tag_model.dart';

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

class StoreHome {
  String name;
  String? category;
  Menu menu;

  StoreHome({required this.name, required this.menu, this.category});

  factory StoreHome.fromJson(Map<String, dynamic> json) => StoreHome(
        name: json['name'],
        menu: Menu.fromHomeJson(json['menu']),
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
      maxDiscountMenu: MenuSimple(discountRate: json['maxDiscount']),
      /* Optional */
      imgUrl: json['storePictureUrl'],
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
  String phone;
  /* Optional */
  String? imgUrl;
  String? description;

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
    required this.phone,
    this.imgUrl,
    this.description,
  });

  factory StoreDetail.fromJson(Map<dynamic, dynamic> json) {
    final origins = (json['menus'] as List)
        .expand((e) => e['countryOfOrigin'] ?? [])
        .toList()
        .map((e) => Origin.fromJson(e))
        .toList();

    return StoreDetail(
      id: json['id'],
      name: json['name'],
      categories: (json['categories'] as List)
          .map((e) => e['name'].toString())
          .toList(),
      address: json['detail']['address'] +
          (json['detail']['addressDetail'] == null
              ? ""
              : " ${json['detail']['addressDetail']}"),
      latLng: LatLng(
        double.parse(json['detail']['lat']),
        double.parse(json['detail']['lon']),
      ),
      pickUpTime: json['detail']['pickUpTime'],
      openTime: json['detail']['operationTimes']['startedAt'],
      closeTime: json['detail']['operationTimes']['endedAt'],
      menu: (json['menus'] as List).map((e) => Menu.fromStoreJson(e)).toList(),
      notes: (json['caution'] as List).map((e) => e.toString()).toList(),
      origins: origins,
      phone: json['detail']['phone'],
      /* Optional */
      imgUrl: json['detail']['storePictureUrl'],
      description: json['detail']['description'],
    );
  }
}

class StoreMenu {
  int id;
  String name;
  String address;
  LatLng latLng;
  String pickUpTime;
  String phone;

  StoreMenu({
    required this.id,
    required this.name,
    required this.address,
    required this.latLng,
    required this.pickUpTime,
    required this.phone,
  });

  factory StoreMenu.fromJson(Map<String, dynamic> json) {
    return StoreMenu(
      id: json['id'],
      name: json['name'],
      address: json['detail']['address'] +
          (json['detail']['addressDetail'] == null
              ? ""
              : " ${json['detail']['addressDetail']}"),
      latLng: LatLng(
        double.parse(json['detail']['lat']),
        double.parse(json['detail']['lon']),
      ),
      pickUpTime: json['detail']['pickUpTime'],
      phone: json['detail']['phone'],
    );
  }
}
