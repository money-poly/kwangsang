import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:immersion_kwangsang/models/menu/menu_listitem_model.dart';

part 'menu_limit_stock_model.freezed.dart';
part 'menu_limit_stock_model.g.dart';

@Freezed(toJson: false)
class MenuLimitStockModel with _$MenuLimitStockModel {
  factory MenuLimitStockModel({
    required List<MenuListItemModel> menus,
    required int totalCount,
  }) = _MenuLimitStockModel;

  factory MenuLimitStockModel.fromJson(Map<String, dynamic> json) =>
      _$MenuLimitStockModelFromJson(json);
}
