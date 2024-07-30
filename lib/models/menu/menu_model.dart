import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:immersion_kwangsang/enums/menu_status.dart';
import 'package:immersion_kwangsang/models/origin/origin_model.dart';
import 'package:immersion_kwangsang/models/tag/tag_model.dart';

part 'menu_model.freezed.dart';
part 'menu_model.g.dart';

@freezed
class Menu with _$Menu {
  factory Menu({
    required int id,
    required String name,
    required int discountRate,
    @JsonKey(name: 'sellingPrice') required int discountPrice,
    @JsonKey(name: 'price') int? regularPrice,
    @JsonKey(name: 'menuPictureUrl') String? imgUrl,
    String? description,
    @JsonKey(name: 'storeName') String? store,
    @ViewSerializer() int? view,
    List<Tag>? tags,
    List<Origin>? origins,
    @JsonKey(
      fromJson: EMenuStatus.fromJson,
      toJson: EMenuStatus.toJson,
    )
    EMenuStatus? status,
    int? count,
    DateTime? expiredDate,
  }) = _Menu;

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);
}

class ViewSerializer implements JsonConverter<int?, Map<String, dynamic>> {
  const ViewSerializer();

  @override
  int? fromJson(Map<String, dynamic> json) {
    return json['viewCount'] ?? json['view']['viewCount'];
  }

  @override
  Map<String, dynamic> toJson(int? view) {
    return {'viewCount': view};
  }
}
