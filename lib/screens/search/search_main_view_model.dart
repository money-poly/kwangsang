import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/models/menu.dart';
import 'package:immersion_kwangsang/models/tag.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SearchStatus { before, after }

class SearchMainViewModel with ChangeNotifier {
  List<String> _keywords = [];
  final TextEditingController _searchController = TextEditingController();
  bool _keywordsIsEmpty = true;
  List<String> _history = [];
  SearchStatus _status = SearchStatus.before;
  List<Menu>? _menus;

  List<String> get keywords => _keywords;
  TextEditingController get searchController => _searchController;
  bool get keywordsIsEmpty => _keywordsIsEmpty;
  List<String> get history => _history;
  SearchStatus get status => _status;
  List<Menu>? get menus => _menus;

  SearchMainViewModel() {
    getKeywords();
    searchController.addListener(() {
      if (searchController.text.isEmpty) {
        _keywordsIsEmpty = true;
      } else {
        _keywordsIsEmpty = false;
      }
      // notifyListeners();
    });
    getRecords();
  }

  Future<void> getKeywords() async {
    final tempKeywords = [
      "치킨",
      "샌드위치",
      "신당동떡볶이",
      "장충동족발",
      "뷔페",
      "배달",
      "빵",
      "샐러드",
      "돈까스",
      "할인"
    ];
    _keywords = tempKeywords;
    notifyListeners();
  }

  Future<void> search(String keyword) async {
    _searchController.text = keyword;
    changeStatus(SearchStatus.after);
    await getMenus();
    await saveHistory(keyword);
    notifyListeners();
  }

  Future<void> saveHistory(String keyword) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (keyword.isEmpty) {
      return;
    }
    if (_history.contains(keyword)) {
      _history.remove(keyword);
    }
    _history.add(keyword);
    await prefs.setStringList('searchHistory', _history);
    notifyListeners();
  }

  Future<void> removeHistory(String keyword) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _history.remove(keyword);
    await prefs.setStringList('searchHistory', _history);
    notifyListeners();
  }

  Future<void> clearHistory() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _history = [];
    await prefs.setStringList('searchHistory', _history);
    notifyListeners();
  }

  Future<void> getRecords() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _history = prefs.getStringList('searchHistory') ?? [];
    notifyListeners();
  }

  void changeStatus(SearchStatus status) {
    _status = status;
    notifyListeners();
  }

  Future<void> getMenus() async {
    final List<Menu> tempMenus = [
      Menu(
          id: 1,
          name: "양념 치킨",
          discountRate: 10,
          discountPrice: 20900,
          imgUrl:
              "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20210316_22%2F1615866542833460Bs_JPEG%2FEPYlyuBM9Sd5XP-ChhBTkLev.jpg",
          store: "누구나 반한 닭",
          view: 8,
          tags: [
            Tag(
                name: "마감할인",
                txtColor: KwangColor.green,
                bgColor: KwangColor.grey300),
          ]),
      Menu(
          id: 2,
          name: "파닭 존맛탱입니다 존맛존맛존맛존맛",
          discountRate: 10,
          discountPrice: 20900,
          imgUrl:
              "https://ldb-phinf.pstatic.net/20211201_276/1638314448912aitj0_JPEG/nKfrwz87arUAxjYhlXPHpU5xo_DIhwSKWohwHmQrhDM%3D.jpg",
          store: "네네치킨",
          view: 2,
          tags: [
            Tag(
                icon: "time",
                name: "마감할인",
                txtColor: KwangColor.green,
                bgColor: KwangColor.grey300),
          ]),
      Menu(
          id: 3,
          name: "치킨 샐러드 존맛탱입니다 맛있어요",
          discountRate: 10,
          discountPrice: 20900,
          imgUrl:
              "https://cphoto.asiae.co.kr/listimglink/1/2021072914403655715_1627537236.jpg",
          store: "네네치킨",
          view: 12000,
          tags: [
            Tag(
                icon: "time",
                name: "마감할인",
                txtColor: KwangColor.green,
                bgColor: KwangColor.grey300),
          ]),
    ];
    _menus = tempMenus;
    notifyListeners();
  }
}
