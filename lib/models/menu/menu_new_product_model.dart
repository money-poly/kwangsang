import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:immersion_kwangsang/models/menu/menu_model.dart';
import 'package:immersion_kwangsang/models/store/store_model.dart';

part 'menu_new_product_model.freezed.dart';
part 'menu_new_product_model.g.dart';

@freezed
class MenuNewProductModel with _$MenuNewProductModel {
  factory MenuNewProductModel({
    required DateTime saleTime,
    required List<MenuNewProductStoreItemModel> stores,
  }) = _MenuNewProductModel;

  factory MenuNewProductModel.fromJson(Map<String, dynamic> json) =>
      _$MenuNewProductModelFromJson(json);
}

@freezed
class MenuNewProductStoreItemModel with _$MenuNewProductStoreItemModel {
  factory MenuNewProductStoreItemModel({
    required Store store,
    required List<Menu> menus,
  }) = _MenuNewProductStoreItemModel;

  factory MenuNewProductStoreItemModel.fromJson(Map<String, dynamic> json) =>
      _$MenuNewProductStoreItemModelFromJson(json);
}
