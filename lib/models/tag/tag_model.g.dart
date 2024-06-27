// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TagImpl _$$TagImplFromJson(Map<String, dynamic> json) => _$TagImpl(
      icon: json['icon'] as String? ?? 'time',
      name: json['name'] as String,
      txtColor: hexToColor(json['txtColor'] as String),
      bgColor: hexToColor(json['bgColor'] as String),
    );

Map<String, dynamic> _$$TagImplToJson(_$TagImpl instance) => <String, dynamic>{
      'icon': instance.icon,
      'name': instance.name,
      'txtColor': colorToHex(instance.txtColor),
      'bgColor': colorToHex(instance.bgColor),
    };
