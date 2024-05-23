import 'package:flutter/material.dart';

enum Order {
  last("최신순"),
  distance("거리순"),
  name("이름순");

  const Order(this.str);
  final String str;
}

enum ECategory {
  all('전체'),
  korean('한식'),
  chinese('중식'),
  japanese('일식'),
  western('양식'),
  snack('분식');

  final String title;

  const ECategory(this.title);
}

enum EHomeTab {
  recommend('추천상품'),
  limitStock('품절임박'),
  newProduct('신상품'),
  bestProduct('베스트');

  final String tabTitle;

  const EHomeTab(this.tabTitle);
}

class HomeViewModel with ChangeNotifier {
  late final TabController _tabController;
  late final List<Tab> _tabs;

  TabController get tabController => _tabController;
  List<Tab> get tabs => _tabs;

  HomeViewModel() {
    _tabs = [
      for (var tab in EHomeTab.values)
        Tab(
          text: tab.tabTitle,
        ),
    ];
  }

  ///  viewModel에서 [tabController]에 접근하기 위한 초기화 메서드입니다. \
  /// [initState]에서 1회만 호출하세요.
  ///
  /// 주입받은 [tabController]는 별도로 [dispose]되지 않으니 \
  /// [tabController]을 생성한 위젯에서 [dispose]해야 합니다.
  void initTabController({
    required TabController tabController,
  }) {
    _tabController = tabController;
  }

  void changeTab(EHomeTab tab) {
    var idx = EHomeTab.values.indexOf(tab);
    _tabController.animateTo(idx);
  }
}
