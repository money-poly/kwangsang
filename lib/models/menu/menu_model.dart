import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:immersion_kwangsang/models/origin/origin_model.dart';
import 'package:immersion_kwangsang/models/tag/tag_model.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/utils/menu_status_util.dart';

part 'menu_model.freezed.dart';
part 'menu_model.g.dart';

enum MenuStatus {
  sale("판매중", KwangColor.primary400, "고객들에게 판매할 수 있는 상태"),
  hidden("숨김", KwangColor.grey600, "일시적으로 숨김처리되어 메뉴가 보이지 않는 상태"),
  soldout("품절", KwangColor.red, "메뉴는 노출되지만 품절 표시인 상태");

  const MenuStatus(this.str, this.color, this.description);
  final String str;
  final Color color;
  final String description;
}

@freezed
class Menu with _$Menu {
  factory Menu({
    @JsonKey(name: 'menuId') required int id,
    @JsonKey(name: 'menuName') required String name,
    required int discountRate,
    @JsonKey(name: 'sellingPrice') required int discountPrice,
    @JsonKey(name: 'price') int? regularPrice,
    @JsonKey(name: 'menuPictureUrl') String? imgUrl,
    String? description,
    @JsonKey(name: 'storeName') String? store,
    @ViewSerializer() int? view,
    List<Tag>? tags,
    List<Origin>? origins,
    MenuStatus? status,
    int? count,
    DateTime? expiredDate,
  }) = _Menu;

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);

  factory Menu.fromStoreJson(Map<String, dynamic> json) => Menu(
        id: json['id'],
        name: json['name'],
        discountRate: json['discountRate'],
        discountPrice: json['sellingPrice'],
        imgUrl: json['menuPictureUrl'],
        /* Optional */
        regularPrice: json['price'],
        description: json['description'],
        store: json['storeName'],
        view: const ViewSerializer().fromJson(json),
        tags: json['tags'],
        origins: json['origins'],
        status: json['status'] == null ? null : strToMenuStatus(json['status']),
      );

  factory Menu.fromHomeJson(Map<String, dynamic> json) => Menu(
        id: json['id'],
        name: json['name'],
        discountRate: json['discountRate'],
        discountPrice: json['sellingPrice'],
        imgUrl: json['menuPictureUrl'],
        /* Optional */
        regularPrice: json['price'],
        description: json['description'],
        store: json['storeName'],
        view: const ViewSerializer().fromJson(json),
        tags: json['tags'],
        origins: json['origins'],
      );

  factory Menu.fromDetailJson(Map<String, dynamic> json) => Menu(
        id: json['menuId'],
        name: json['name'],
        discountRate: json['discountRate'],
        discountPrice: json['sellingPrice'],
        imgUrl: json['menuPictureUrl'],
        /* Optional */
        regularPrice: json['price'],
        description: json['description'],
        store: json['storeName'],
        view: const ViewSerializer().fromJson(json),
        tags: json['tags'],
        origins: json['origins'],
        status: json['status'] == null ? null : strToMenuStatus(json['status']),
      );
}

class ViewSerializer implements JsonConverter<int?, Map<String, dynamic>> {
  const ViewSerializer();

  @override
  int? fromJson(Map<String, dynamic> json) {
    return json['viewCount'] ?? json['view'];
  }

  @override
  Map<String, dynamic> toJson(int? view) {
    return {'viewCount': view};
  }
}
