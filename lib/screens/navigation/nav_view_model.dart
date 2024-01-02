import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/screens/home/home_view.dart';
import 'package:immersion_kwangsang/screens/home/home_view_model.dart';
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
  List<Widget> get pages => [
    ChangeNotifierProvider(
      create: (context) => HomeViewModel(context),
      child: const HomeView(),
    ),
    ChangeNotifierProvider(
      create: (context) => MapMainViewModel(context),
      child: const MapMainView(),
    ),
    Placeholder()
  ];

  int get currIdx => _currIdx;

  bool canChangeIdx(int idx) {
    switch (idx) {
      case 2:
        return false;
      default:
        return true;
    }
  }

  void changeIdx(int idx) {
    if (canChangeIdx(idx)) {
      _currIdx = idx;
    }
    notifyListeners();
  }
}
