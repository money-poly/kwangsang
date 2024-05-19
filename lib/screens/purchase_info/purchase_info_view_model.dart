import 'package:flutter/foundation.dart';

enum EPurchaseInfoPhase {
  pending('주문 요청', '주문 승인 대기 중이에요'),
  accepted('주문 승인', '주문이 승인되었어요'),
  pickup('픽업 대기', '상품이 준비되어 픽업을 기다리고 있어요'),
  completed('픽업 완료', '픽업이 완료되었어요, 맛있게 드세요!');

  final String progressText;
  final String phaseTitle;

  const EPurchaseInfoPhase(
    this.progressText,
    this.phaseTitle,
  );
}

class PurchaseInfoViewModel extends ChangeNotifier {
  late final bool _isMember;
  EPurchaseInfoPhase _phase = EPurchaseInfoPhase.pending;

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
