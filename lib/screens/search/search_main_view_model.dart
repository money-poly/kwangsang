import 'package:flutter/material.dart';

class SearchMainViewModel with ChangeNotifier {
  List<String> _keywords = [];
  final TextEditingController _searchController = TextEditingController();
  bool _keywordsIsEmpty = true;

  List<String> get keywords => _keywords;
  TextEditingController get searchController => _searchController;
  bool get keywordsIsEmpty => _keywordsIsEmpty;

  SearchMainViewModel() {
    getKeywords();
    searchController.addListener(() {
      if (searchController.text.isEmpty) {
        _keywordsIsEmpty = true;
      } else {
        _keywordsIsEmpty = false;
      }
      notifyListeners();
    });
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

  Future<void> search(String keyword) async {}
}
