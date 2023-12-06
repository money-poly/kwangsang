import 'package:immersion_kwangsang/models/tag.dart';

class MenuSimple {
  String? name;
  int? originPrice;
  int? discountPrice;
  int discountRate;

  MenuSimple({
    this.name,
    this.originPrice,
    this.discountPrice,
    required this.discountRate,
  });
}

class Menu {
  String name;
  int discountRate;
  int price;
  String imgUrl;
  String? description;
  String? store;
  int? view;
  List<Tag>? tags;

  Menu({
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
