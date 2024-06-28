// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreImpl _$$StoreImplFromJson(Map<String, dynamic> json) => _$StoreImpl(
      name: json['storeName'] as String,
      maxDiscountMenu:
          MenuSimple.fromJson(json['menu'] as Map<String, dynamic>),
      description: json['description'] as String?,
      category: json['category'] as String?,
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      imgUrl: json['storePictureUrl'] as String?,
    );

Map<String, dynamic> _$$StoreImplToJson(_$StoreImpl instance) =>
    <String, dynamic>{
      'storeName': instance.name,
      'menu': instance.maxDiscountMenu,
      'description': instance.description,
      'category': instance.category,
      'tags': instance.tags,
      'storePictureUrl': instance.imgUrl,
    };
