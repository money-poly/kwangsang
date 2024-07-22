import 'package:flutter/foundation.dart';
import 'package:immersion_kwangsang/enums/purchase_info_phase.dart';

class PurchaseInfoViewModel extends ChangeNotifier {
  late final bool _isMember;
  // TODO: Initialize with API
  EPurchaseInfoPhase _phase = EPurchaseInfoPhase.request;

  PurchaseInfoViewModel({
    required bool isMember,
  }) : _isMember = isMember;

  bool get isMember => _isMember;
  EPurchaseInfoPhase get phase => _phase;

  // TODO: hide interface - will chage automatically
  void changePhase(EPurchaseInfoPhase phase) {
    _phase = phase;
    notifyListeners();
  }
}
