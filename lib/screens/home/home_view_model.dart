import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/models/menu.dart';

enum TabTypes {
  all("전체"),
  pakcedLunch("도시락"),
  buffet("뷔페"),
  desert("디저트"),
  sideDish("반찬"),
  fruits("과일/야채");

  const TabTypes(this.str);
  final String str;
}

class HomeViewModel with ChangeNotifier {
  final List<Tab> _tabs = TabTypes.values.map((e) => Tab(text: e.str)).toList();
  final List<Menu> _menus = [
    Menu(
        name: "양념 치킨",
        discountRate: 10,
        price: 20900,
        imgUrl:
            "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20210316_22%2F1615866542833460Bs_JPEG%2FEPYlyuBM9Sd5XP-ChhBTkLev.jpg",
        store: "누구나 반한 닭",
        view: 8,
        tags: []),
    Menu(
        name: "파닭 존맛탱입니다 존맛존맛존맛존맛",
        discountRate: 10,
        price: 20900,
        imgUrl:
            "https://ldb-phinf.pstatic.net/20211201_276/1638314448912aitj0_JPEG/nKfrwz87arUAxjYhlXPHpU5xo_DIhwSKWohwHmQrhDM%3D.jpg",
        store: "네네치킨",
        view: 2,
        tags: []),
    Menu(
        name: "치킨 샐러드 존맛탱입니다 맛있어요",
        discountRate: 10,
        price: 20900,
        imgUrl:
            "https://cphoto.asiae.co.kr/listimglink/1/2021072914403655715_1627537236.jpg",
        store: "네네치킨",
        view: 2,
        tags: []),
  ];

  List<Widget> get tabs => _tabs;
  List<Menu> get menus => _menus;
}
