import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class Category with _$Category {
  factory Category({
    required int id,
    required String name,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
