// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuImpl _$$MenuImplFromJson(Map<String, dynamic> json) => _$MenuImpl(
      id: (json['menuId'] as num).toInt(),
      name: json['menuName'] as String,
      discountRate: (json['discountRate'] as num).toInt(),
      discountPrice: (json['sellingPrice'] as num).toInt(),
      regularPrice: (json['price'] as num?)?.toInt(),
      imgUrl: json['menuPictureUrl'] as String?,
      description: json['description'] as String?,
      store: json['storeName'] as String?,
      view: _$JsonConverterFromJson<Map<String, dynamic>, int?>(
          json['view'], const ViewSerializer().fromJson),
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      origins: (json['origins'] as List<dynamic>?)
          ?.map((e) => Origin.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: $enumDecodeNullable(_$MenuStatusEnumMap, json['status']),
      count: (json['count'] as num?)?.toInt(),
      expiredDate: json['expiredDate'] == null
          ? null
          : DateTime.parse(json['expiredDate'] as String),
    );

Map<String, dynamic> _$$MenuImplToJson(_$MenuImpl instance) =>
    <String, dynamic>{
      'menuId': instance.id,
      'menuName': instance.name,
      'discountRate': instance.discountRate,
      'sellingPrice': instance.discountPrice,
      'price': instance.regularPrice,
      'menuPictureUrl': instance.imgUrl,
      'description': instance.description,
      'storeName': instance.store,
      'view': const ViewSerializer().toJson(instance.view),
      'tags': instance.tags,
      'origins': instance.origins,
      'status': _$MenuStatusEnumMap[instance.status],
      'count': instance.count,
      'expiredDate': instance.expiredDate?.toIso8601String(),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

const _$MenuStatusEnumMap = {
  MenuStatus.sale: 'sale',
  MenuStatus.hidden: 'hidden',
  MenuStatus.soldout: 'soldout',
};
