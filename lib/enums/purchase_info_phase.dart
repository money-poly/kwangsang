enum EPurchaseInfoPhase {
  request('주문 요청', '주문 승인 대기 중이에요'),
  approve('주문 승인', '주문이 승인되었어요'),
  prepare('픽업 대기', '상품이 준비되어 픽업을 기다리고 있어요'),
  success('픽업 완료', '픽업이 완료되었어요, 맛있게 드세요!'),
  reject('요청 거부', '매장 사정으로 요청이 거부되었어요'),
  cancel('요청 취소', '요청이 취소되었어요');

  final String progressText;
  final String phaseTitle;

  const EPurchaseInfoPhase(
    this.progressText,
    this.phaseTitle,
  );

  static String? toJson(EPurchaseInfoPhase? phase) {
    switch (phase) {
      case EPurchaseInfoPhase.request:
        return 'request';
      case EPurchaseInfoPhase.approve:
        return 'approve';
      case EPurchaseInfoPhase.prepare:
        return 'prepare';
      case EPurchaseInfoPhase.success:
        return 'success';
      case EPurchaseInfoPhase.reject:
        return 'reject';
      case EPurchaseInfoPhase.cancel:
        return 'cancel';
      case null:
        return null;
      default:
        throw Exception(
            '[EPurchaseInfoPhase.toJson] Unknown type value: $phase');
    }
  }

  static EPurchaseInfoPhase? fromJson(String? str) {
    switch (str) {
      case 'request':
        return EPurchaseInfoPhase.request;
      case 'approve':
        return EPurchaseInfoPhase.approve;
      case 'prepare':
        return EPurchaseInfoPhase.prepare;
      case 'success':
        return EPurchaseInfoPhase.success;
      case 'reject':
        return EPurchaseInfoPhase.reject;
      case 'cancel':
        return EPurchaseInfoPhase.cancel;
      case null:
        return null;
      default:
        throw Exception(
            '[EPurchaseInfoPhase.fromJson] Unknown string value: $str');
    }
  }
}
