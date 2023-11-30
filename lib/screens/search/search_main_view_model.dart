import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchMainViewModel with ChangeNotifier {
  List<String> _keywords = [];
  final TextEditingController _searchController = TextEditingController();
  bool _keywordsIsEmpty = true;
  List<String> _history = [];

  List<String> get keywords => _keywords;
  TextEditingController get searchController => _searchController;
  bool get keywordsIsEmpty => _keywordsIsEmpty;
  List<String> get history => _history;

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
}
