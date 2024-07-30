import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:immersion_kwangsang/models/menu/menu_model.dart';
import 'package:immersion_kwangsang/models/store/store_model.dart';

part 'menu_listitem_model.freezed.dart';
part 'menu_listitem_model.g.dart';

@Freezed(toJson: false)
class MenuListItemModel with _$MenuListItemModel {
  factory MenuListItemModel({
    required Menu menu,
    required Store store,
  }) = _MenuListItemModel;

  factory MenuListItemModel.fromJson(Map<String, dynamic> json) =>
      _$MenuListItemModelFromJson(json);
}
