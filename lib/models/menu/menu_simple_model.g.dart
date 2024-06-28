// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_simple_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuSimpleImpl _$$MenuSimpleImplFromJson(Map<String, dynamic> json) =>
    _$MenuSimpleImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      originPrice: (json['originPrice'] as num?)?.toInt(),
      discountPrice: (json['discountPrice'] as num?)?.toInt(),
      discountRate: (json['discountRate'] as num).toInt(),
    );

Map<String, dynamic> _$$MenuSimpleImplToJson(_$MenuSimpleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'originPrice': instance.originPrice,
      'discountPrice': instance.discountPrice,
      'discountRate': instance.discountRate,
    };
