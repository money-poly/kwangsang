import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:immersion_kwangsang/models/menu/menu_model.dart';

part 'store_home_model.freezed.dart';
part 'store_home_model.g.dart';

@freezed
class StoreHome with _$StoreHome {
  factory StoreHome({
    required String name,
    String? category,
    @JsonKey(
      fromJson: Menu.fromHomeJson,
    )
    required Menu menu,
  }) = _StoreHome;

  factory StoreHome.fromJson(Map<String, dynamic> json) =>
      _$StoreHomeFromJson(json);
}
