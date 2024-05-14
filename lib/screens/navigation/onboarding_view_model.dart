import 'package:flutter/material.dart';

class OnBoardingViewModel with ChangeNotifier {
  int _currIdx = 0;
  int get currIdx => _currIdx;

  void setCurrentPage(int idx) {
    _currIdx = idx;
    notifyListeners();
  }
}
