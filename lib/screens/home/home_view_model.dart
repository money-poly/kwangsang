import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

enum Order {
  last("최신순"),
  distance("거리순"),
  name("이름순");

  const Order(this.str);
  final String str;
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
  final List<Tab> _tabs =
      EHomeTab.values.map((e) => Tab(text: e.tabTitle)).toList();
  
  final CarouselController _carouselController = CarouselController();
  int _recommendCurrIdx = 0;

  TabController get tabController => _tabController;
  List<Tab> get tabs => _tabs;
  CarouselController get carouselController => _carouselController;
  int get recommendCurrIdx => _recommendCurrIdx;

  HomeViewModel(TickerProvider vsync) {
    _tabController = TabController(
      length: _tabs.length,
      vsync: vsync,
    );
  }

  void changeTab(EHomeTab tab) {
    var idx = EHomeTab.values.indexOf(tab);
    _tabController.animateTo(idx);
  }

  void changeRecommendCurridx(int idx) {
    _recommendCurrIdx = idx;
    notifyListeners();
  }
}