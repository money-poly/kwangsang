enum EMenuSortOption {
  price('가격순'),
  discount('할인율순'),
  expire('소비기한순'),
  popular('인기순');

  final String text;

  const EMenuSortOption(this.text);

  static String? toJson(EMenuSortOption? option) {
    switch (option) {
      case EMenuSortOption.price:
        return 'price';
      case EMenuSortOption.discount:
        return 'discount';
      case EMenuSortOption.expire:
        return 'expire';
      case EMenuSortOption.popular:
        return 'popular';
      case null:
        return null;
      default:
        throw Exception('[EMenuSortOption.toJson] Unknown type value: $option');
    }
  }

  static EMenuSortOption? fromJson(String? str) {
    switch (str) {
      case 'price':
        return EMenuSortOption.price;
      case 'discount':
        return EMenuSortOption.discount;
      case 'expire':
        return EMenuSortOption.expire;
      case 'popular':
        return EMenuSortOption.popular;
      case null:
        return null;
      default:
        throw Exception(
            '[EMenuSortOption.fromJson] Unknown string value: $str');
    }
  }
}

extension EMenuSortOptionExtension on EMenuSortOption {
  String? get key => EMenuSortOption.toJson(this);
}
