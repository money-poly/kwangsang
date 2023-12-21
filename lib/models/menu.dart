import 'package:immersion_kwangsang/models/tag.dart';

class MenuSimple {
  int id;
  String? name;
  int? originPrice;
  int? discountPrice;
  int discountRate;

  MenuSimple({
    required this.id,
    this.name,
    this.originPrice,
    this.discountPrice,
    required this.discountRate,
  });
}

class Menu {
  int id;
  String name;
  int discountRate;
  int price;
  String imgUrl;
  String? description;
  String? store;
  int? view;
  List<Tag>? tags;

  Menu({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.discountRate,
    required this.price,
    this.description,
    this.store,
    this.view,
    this.tags,
  });
}
