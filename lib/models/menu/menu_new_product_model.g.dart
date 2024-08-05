// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_new_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuNewProductModelImpl _$$MenuNewProductModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MenuNewProductModelImpl(
      saleTime: DateTime.parse(json['saleTime'] as String),
      stores: (json['stores'] as List<dynamic>)
          .map((e) =>
              MenuNewProductStoreItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MenuNewProductModelImplToJson(
        _$MenuNewProductModelImpl instance) =>
    <String, dynamic>{
      'saleTime': instance.saleTime.toIso8601String(),
      'stores': instance.stores,
    };

_$MenuNewProductStoreItemModelImpl _$$MenuNewProductStoreItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MenuNewProductStoreItemModelImpl(
      store: Store.fromJson(json['store'] as Map<String, dynamic>),
      menus: (json['menus'] as List<dynamic>)
          .map((e) => Menu.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MenuNewProductStoreItemModelImplToJson(
        _$MenuNewProductStoreItemModelImpl instance) =>
    <String, dynamic>{
      'store': instance.store,
      'menus': instance.menus,
    };
