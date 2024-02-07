import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:immersion_kwangsang/models/menu.dart';
import 'package:immersion_kwangsang/services/search_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SearchStatus { before, after }

class SearchMainViewModel with ChangeNotifier {
  final _service = SearchService();

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
    });
    getRecords();
  }

  Future<void> getKeywords() async {
    _keywords = await _service.getRecommendKeywords();
    notifyListeners();
  }

  Future<void> search(String keyword, LatLng latLng) async {
    _searchController.text = keyword;
    if (keyword.length < 2) {
      return;
    } else {
      changeStatus(SearchStatus.after);
      await getMenus(keyword, latLng);
      await saveHistory(keyword);
    }
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

  Future<void> getMenus(String keyword, LatLng latlng) async {
    _menus = null;
    _menus = await _service.search(keyword, latlng);
    notifyListeners();
  }
}
