enum ECategory {
  all('전체'),
  korean('한식'),
  chinese('중식'),
  japanese('일식'),
  western('양식'),
  snack('분식'),
  cafe('카페'),
  dessert('디저트');
  // franchise('프랜차이즈');

  final String title;

  const ECategory(this.title);

  static String? toJson(ECategory? category) {
    switch (category) {
      case ECategory.all:
        return 'all';
      case ECategory.korean:
        return 'korean';
      case ECategory.chinese:
        return 'chinese';
      case ECategory.japanese:
        return 'japanese';
      case ECategory.western:
        return 'western';
      case ECategory.snack:
        return 'snack';
      case ECategory.cafe:
        return 'cafe';
      case ECategory.dessert:
        return 'dessert';
      // case ECategory.franchise:
      //   return 'franchise';
      case null:
        return null;
      default:
        throw Exception('[ECategory.toJson] Unknown type value: $category');
    }
  }

  static ECategory? fromJson(String? str) {
    switch (str) {
      case 'all':
        return ECategory.all;
      case 'korean':
        return ECategory.korean;
      case 'chinese':
        return ECategory.chinese;
      case 'japanese':
        return ECategory.japanese;
      case 'western':
        return ECategory.western;
      case 'snack':
        return ECategory.snack;
      case 'cafe':
        return ECategory.cafe;
      case 'dessert':
        return ECategory.dessert;
      // case 'franchise':
      //   return ECategory.franchise;
      case null:
        return null;
      default:
        throw Exception('[ECategory.fromJson] Unknown string value: $str');
    }
  }
}

extension ECategoryExtension on ECategory {
  String? get key => ECategory.toJson(this);
}
