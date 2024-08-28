// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_limit_stock_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuLimitStockModelImpl _$$MenuLimitStockModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MenuLimitStockModelImpl(
      menus: (json['menus'] as List<dynamic>)
          .map((e) => MenuListItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: (json['totalCount'] as num).toInt(),
    );
