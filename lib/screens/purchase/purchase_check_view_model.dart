import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/models/menu.dart';

enum PurchaseWay {
  simple("간편 결제"),
  normal("일반 결제"),
  face("방문 결제 (만나서 직접 결제)");

  const PurchaseWay(this.str);
  final String str;
}

class PurchaseCheckViewModel with ChangeNotifier {
  PurchaseWay? _selectedWay;
  PurchaseWay? get selectedWay => _selectedWay;
  List<Menu> get tempMenus => [
        Menu(
            id: 1,
            name: "고구마 휘낭시에",
            imgUrl: null,
            discountRate: 10,
            discountPrice: 2000,
            count: 3),
        Menu(
            id: 2,
            name: "감자 휘낭시에",
            imgUrl: null,
            discountRate: 10,
            discountPrice: 2000,
            count: 10),
        Menu(
            id: 1,
            name: "고구마 휘낭시에",
            imgUrl: null,
            discountRate: 10,
            discountPrice: 2000,
            count: 5)
      ];

  void selectWay(PurchaseWay way) {
    _selectedWay = way;
    notifyListeners();
  }
}
