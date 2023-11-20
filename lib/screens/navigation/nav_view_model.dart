import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/screens/map/map_main_view.dart';
import 'package:immersion_kwangsang/screens/map/map_main_view_model.dart';
import 'package:provider/provider.dart';

enum NavItems {
  home("홈"),
  map("내 근처"),
  user("MY");

  const NavItems(this.label);
  final String label;
}

class NavViewModel with ChangeNotifier {
  int _currIdx = 0;
  final List<Widget> _pages = [
    Placeholder(),
    ChangeNotifierProvider(
      create: (_) => MapMainViewModel(),
      child: const MapMainView(),
    ),
    Placeholder()
  ];

  int get currIdx => _currIdx;
  Widget get currPages => _pages[currIdx];

  void changeIdx(int idx) {
    _currIdx = idx;
    notifyListeners();
  }
}
