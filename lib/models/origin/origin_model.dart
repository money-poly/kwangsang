import 'package:freezed_annotation/freezed_annotation.dart';

part 'origin_model.freezed.dart';
part 'origin_model.g.dart';

@freezed
class Origin with _$Origin {
  factory Origin({
    required String ingredient,
    required String country,
  }) = _Origin;

  factory Origin.fromJson(Map<String, dynamic> json) => _$OriginFromJson(json);
}
