import 'package:immersion_kwangsang/models/origin.dart';
import 'package:immersion_kwangsang/models/tag.dart';

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
        view: json['view'],
        tags: json['tags'],
        origins: json['origins'],
      );

  factory Menu.fromStoreJson(Map<String, dynamic> json) => Menu(
        id: json['id'],
        name: json['name'],
        discountRate: json['discountRate'],
        discountPrice: json['salePrice'],
        imgUrl: json['menuPictureUrl'],
        /* Optional */
        regularPrice: json['price'],
        description: json['description'],
        store: json['storeName'],
        view: json['view'],
        tags: json['tags'],
        origins: json['origins'],
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
        view: json['view'],
        tags: json['tags'],
        origins: json['origins'],
      );
}
