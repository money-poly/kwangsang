import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:immersion_kwangsang/models/menu/menu_model.dart';

part 'menu_simple_model.freezed.dart';
part 'menu_simple_model.g.dart';

@freezed
class MenuSimple with _$MenuSimple {
  factory MenuSimple({
    int? id,
    String? name,
    int? originPrice,
    int? discountPrice,
    required int discountRate,
  }) = _MenuSimple;

  factory MenuSimple.fromJson(Map<String, dynamic> json) =>
      _$MenuSimpleFromJson(json);

  factory MenuSimple.fromMenu(Menu menu) => MenuSimple(
        id: menu.id,
        name: menu.name,
        originPrice: menu.regularPrice,
        discountPrice: menu.discountPrice,
        discountRate: menu.discountRate,
      );
}
