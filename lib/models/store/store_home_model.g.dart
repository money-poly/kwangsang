// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreHomeImpl _$$StoreHomeImplFromJson(Map<String, dynamic> json) =>
    _$StoreHomeImpl(
      name: json['name'] as String,
      category: json['category'] as String?,
      menu: Menu.fromHomeJson(json['menu'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StoreHomeImplToJson(_$StoreHomeImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'category': instance.category,
      'menu': instance.menu,
    };
