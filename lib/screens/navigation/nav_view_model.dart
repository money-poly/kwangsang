import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/screens/home/home_view.dart';
import 'package:immersion_kwangsang/screens/map/map_main_view.dart';
import 'package:immersion_kwangsang/services/amplitude.dart';

enum NavItems {
  home("홈"),
  map("내 근처");
  // user("MY");

  const NavItems(this.label);
  final String label;
}

class NavViewModel with ChangeNotifier {
  final analytics = AnalyticsConfig();
  int _currIdx = 0;

  List<Widget> get pages =>
      [const HomeView(), const MapMainView(), const Placeholder()];

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
      analytics.changePage(
        NavItems.values[_currIdx].label,
        NavItems.values[idx].label,
      );
      _currIdx = idx;
    }
    notifyListeners();
  }
}
