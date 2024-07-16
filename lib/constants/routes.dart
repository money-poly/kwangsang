class Routes {
  static const String nav = '/nav';
  static const String onBoarding = '/on-boarding';
  static const String search = '/search';

  /// ### Extra - Required
  static const String category = '/category';
  static const String franchise = '$category/franchise';

  /// ### Path parameter - Required
  /// `/:storeId` [int]
  static const String storeDetail = '/store-detail';

  /// ### Path parameter - Required
  /// `/:menuId` [int]
  static const String menuDetail = '/menu-detail';

  /// ### Extra - Required
  /// extra: MenuBottomSheetViewModel
  ///
  /// MenuBottomSheetViewModel: 담은 상품을 보여주는 바텀 시트에 대한 뷰 모델, \
  /// `context.read<MenuBottomSheetViewModel>`로 가져올 것을 권장합니다.
  static const String menuMore = '/menu-more';

  static const String purchase = '/purchase';
  static const String login = '/login';
  static const String nonMemberLogin = '/non-member-login';
  static const String findOrder = '/find-order';
}
