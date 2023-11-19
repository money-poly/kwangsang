import 'package:flutter/material.dart';

enum NavItems {
  home("홈"),
  map("내 근처"),
  user("MY");

  const NavItems(this.label);
  final String label;
}

class NavViewModel with ChangeNotifier {
  int _currIdx = 0;
  final List<Widget> _pages = [Placeholder(), Placeholder(), Placeholder()];

  int get currIdx => _currIdx;
  Widget get currPages => _pages[currIdx];


  void changeIdx(int idx) {
    _currIdx = idx;
    notifyListeners();
  }
}