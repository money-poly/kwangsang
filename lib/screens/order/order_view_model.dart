import 'package:flutter/material.dart';

class OrderViewModel extends ChangeNotifier {
  List<Tab> tabs = [
    const Tab(text: "진행 중인 주문"),
    const Tab(text: "지난 주문"),
  ];
}
