import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/providers/position_provider.dart';
import 'package:provider/provider.dart';

class OnBoardingViewModel with ChangeNotifier {
  OnBoardingViewModel(BuildContext context) {
    Provider.of<PositionProvider>(context, listen: false);
  }

  int _currIdx = 0;
  int get currIdx => _currIdx;

  void setCurrentPage(int idx) {
    _currIdx = idx;
    notifyListeners();
  }
}
