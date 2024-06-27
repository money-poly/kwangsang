// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_simple.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreSimpleImpl _$$StoreSimpleImplFromJson(Map<String, dynamic> json) =>
    _$StoreSimpleImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      latLng: const LatLngSerializer()
          .fromJson(json['latLng'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StoreSimpleImplToJson(_$StoreSimpleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'latLng': const LatLngSerializer().toJson(instance.latLng),
    };
