import 'package:immersion_kwangsang/models/tag.dart';

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
