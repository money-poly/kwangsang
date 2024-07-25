import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:immersion_kwangsang/models/menu/menu_simple_model.dart';
import 'package:immersion_kwangsang/models/tag/tag_model.dart';

part 'store_model.freezed.dart';
part 'store_model.g.dart';

@freezed
class Store with _$Store {
  factory Store({
    required String name,
    @JsonKey(name: 'menu') required MenuSimple maxDiscountMenu,
    int? maxDiscount,
    String? description,
    String? category,
    List<Tag>? tags,
    @JsonKey(name: 'storePictureUrl') String? imgUrl,
  }) = _Store;

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
}
