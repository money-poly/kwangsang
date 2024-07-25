import 'package:flutter/cupertino.dart';
import 'package:immersion_kwangsang/screens/home/recommend/widgets/item_category.dart';

class CategoryViewModel with ChangeNotifier {
  late ItemCategory selectedCategory;

  CategoryViewModel(ItemCategory category) {
    selectedCategory = category;
  }

  void selectCategory(ItemCategory category) {
    selectedCategory = category;
    notifyListeners();
  }
}
