import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/models/origin.dart';
import 'package:immersion_kwangsang/models/store.dart';
import 'package:immersion_kwangsang/models/tag.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/utils/menu_status_util.dart';

enum MenuStatus {
  sale("판매중", KwangColor.primary400, "고객들에게 판매할 수 있는 상태"),
  hidden("숨김", KwangColor.grey600, "일시적으로 숨김처리되어 메뉴가 보이지 않는 상태"),
  soldout("품절", KwangColor.red, "메뉴는 노출되지만 품절 표시인 상태");

  const MenuStatus(this.str, this.color, this.description);
  final String str;
  final Color color;
  final String description;
}

class MenuSimple {
  int? id;
  String? name;
  int? originPrice;
  int? discountPrice;
  int discountRate;

  MenuSimple({
    this.id,
    this.name,
    this.originPrice,
    this.discountPrice,
    required this.discountRate,
  });

  factory MenuSimple.fromJson(Map<String, dynamic> json) => MenuSimple(
        id: json['menuId'],
        name: json['menuName'],
        originPrice: json['price'],
        discountPrice: json['sellingPrice'],
        discountRate: json['discountRate'],
      );

  factory MenuSimple.fromMenu(Menu menu) => MenuSimple(
        id: menu.id,
        name: menu.name,
        originPrice: menu.regularPrice,
        discountPrice: menu.discountPrice,
        discountRate: menu.discountRate,
      );
}

class Menu {
  int id;
  String name;
  int discountRate;
  int discountPrice;
  int? regularPrice;
  String? imgUrl;
  String? description;
  String? store;
  int? view;
  List<Tag>? tags;
  List<Origin>? origins;
  MenuStatus? status;

  Menu({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.discountRate,
    required this.discountPrice,
    this.regularPrice,
    this.description,
    this.store,
    this.view,
    this.tags,
    this.origins,
    this.status,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        id: json['menuId'],
        name: json['menuName'],
        discountRate: json['discountRate'],
        discountPrice: json['sellingPrice'],
        imgUrl: json['menuPictureUrl'],
        /* Optional */
        regularPrice: json['price'],
        description: json['description'],
        store: json['storeName'],
        view: json['viewCount'] ?? json['view'],
        tags: json['tags'],
        origins: json['origins'],
      );

  factory Menu.fromStoreJson(Map<String, dynamic> json) => Menu(
        id: json['id'],
        name: json['name'],
        discountRate: json['discountRate'],
        discountPrice: json['sellingPrice'],
        imgUrl: json['menuPictureUrl'],
        /* Optional */
        regularPrice: json['price'],
        description: json['description'],
        store: json['storeName'],
        view: json['viewCount'] ?? json['view'],
        tags: json['tags'],
        origins: json['origins'],
        status: json['status'] == null ? null : strToMenuStatus(json['status']),
      );

  factory Menu.fromHomeJson(Map<String, dynamic> json) => Menu(
        id: json['id'],
        name: json['name'],
        discountRate: json['discountRate'],
        discountPrice: json['sellingPrice'],
        imgUrl: json['menuPictureUrl'],
        /* Optional */
        regularPrice: json['price'],
        description: json['description'],
        store: json['storeName'],
        view: json['viewCount'] ?? json['view'],
        tags: json['tags'],
        origins: json['origins'],
      );

  factory Menu.fromDetailJson(Map<String, dynamic> json) => Menu(
        id: json['menuId'],
        name: json['name'],
        discountRate: json['discountRate'],
        discountPrice: json['sellingPrice'],
        imgUrl: json['menuPictureUrl'],
        /* Optional */
        regularPrice: json['price'],
        description: json['description'],
        store: json['storeName'],
        view: json['viewCount'] ?? json['view'],
        tags: json['tags'],
        origins: json['origins'],
        status: json['status'] == null ? null : strToMenuStatus(json['status']),
      );
}

class MenuDetail {
  String name;
  int discountRate;
  int discountPrice;
  int regularPrice;
  StoreMenu store;
  List<Menu> anotherMenus;
  int view;
  List<String> cautions;
  List<Origin> origins;
  int count;
  /* Optional */
  DateTime? expiredDate;
  String? menuPictureUrl;
  String? description;

  MenuDetail({
    required this.name,
    required this.discountRate,
    required this.discountPrice,
    required this.regularPrice,
    required this.store,
    required this.anotherMenus,
    required this.view,
    required this.origins,
    required this.cautions,
    required this.count,
    this.expiredDate,
    this.menuPictureUrl,
    this.description,
  });

  factory MenuDetail.fromJson(Map<dynamic, dynamic> json) => MenuDetail(
        name: json['name'],
        discountRate: json['discountRate'],
        discountPrice: json['sellingPrice'],
        regularPrice: json['price'],
        store: StoreMenu.fromJson(json['store']),
        anotherMenus: (json['anotherMenus'] as List)
            .map((e) => Menu.fromDetailJson(e))
            .toList(),
        view: json['viewCount'],
        cautions: json['caution'].cast<String>(),
        origins: json['countryOfOrigin'] == null
            ? []
            : (json['countryOfOrigin'] as List)
                .map((e) => Origin.fromJson(e))
                .toList(),
        count: json['count'],
        /* Optional */
        expiredDate: json['expiredDate'] == null
            ? null
            : DateTime.parse(json['expiredDate']),
        menuPictureUrl: json['menuPictureUrl'],
        description: json['description'],
      );
}
