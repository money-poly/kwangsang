// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_limit_stock_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MenuLimitStockModel _$MenuLimitStockModelFromJson(Map<String, dynamic> json) {
  return _MenuLimitStockModel.fromJson(json);
}

/// @nodoc
mixin _$MenuLimitStockModel {
  List<MenuListItemModel> get menus => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MenuLimitStockModelCopyWith<MenuLimitStockModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuLimitStockModelCopyWith<$Res> {
  factory $MenuLimitStockModelCopyWith(
          MenuLimitStockModel value, $Res Function(MenuLimitStockModel) then) =
      _$MenuLimitStockModelCopyWithImpl<$Res, MenuLimitStockModel>;
  @useResult
  $Res call({List<MenuListItemModel> menus, int totalCount});
}

/// @nodoc
class _$MenuLimitStockModelCopyWithImpl<$Res, $Val extends MenuLimitStockModel>
    implements $MenuLimitStockModelCopyWith<$Res> {
  _$MenuLimitStockModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menus = null,
    Object? totalCount = null,
  }) {
    return _then(_value.copyWith(
      menus: null == menus
          ? _value.menus
          : menus // ignore: cast_nullable_to_non_nullable
              as List<MenuListItemModel>,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuLimitStockModelImplCopyWith<$Res>
    implements $MenuLimitStockModelCopyWith<$Res> {
  factory _$$MenuLimitStockModelImplCopyWith(_$MenuLimitStockModelImpl value,
          $Res Function(_$MenuLimitStockModelImpl) then) =
      __$$MenuLimitStockModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MenuListItemModel> menus, int totalCount});
}

/// @nodoc
class __$$MenuLimitStockModelImplCopyWithImpl<$Res>
    extends _$MenuLimitStockModelCopyWithImpl<$Res, _$MenuLimitStockModelImpl>
    implements _$$MenuLimitStockModelImplCopyWith<$Res> {
  __$$MenuLimitStockModelImplCopyWithImpl(_$MenuLimitStockModelImpl _value,
      $Res Function(_$MenuLimitStockModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menus = null,
    Object? totalCount = null,
  }) {
    return _then(_$MenuLimitStockModelImpl(
      menus: null == menus
          ? _value._menus
          : menus // ignore: cast_nullable_to_non_nullable
              as List<MenuListItemModel>,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$MenuLimitStockModelImpl implements _MenuLimitStockModel {
  _$MenuLimitStockModelImpl(
      {required final List<MenuListItemModel> menus, required this.totalCount})
      : _menus = menus;

  factory _$MenuLimitStockModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuLimitStockModelImplFromJson(json);

  final List<MenuListItemModel> _menus;
  @override
  List<MenuListItemModel> get menus {
    if (_menus is EqualUnmodifiableListView) return _menus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_menus);
  }

  @override
  final int totalCount;

  @override
  String toString() {
    return 'MenuLimitStockModel(menus: $menus, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuLimitStockModelImpl &&
            const DeepCollectionEquality().equals(other._menus, _menus) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_menus), totalCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuLimitStockModelImplCopyWith<_$MenuLimitStockModelImpl> get copyWith =>
      __$$MenuLimitStockModelImplCopyWithImpl<_$MenuLimitStockModelImpl>(
          this, _$identity);
}

abstract class _MenuLimitStockModel implements MenuLimitStockModel {
  factory _MenuLimitStockModel(
      {required final List<MenuListItemModel> menus,
      required final int totalCount}) = _$MenuLimitStockModelImpl;

  factory _MenuLimitStockModel.fromJson(Map<String, dynamic> json) =
      _$MenuLimitStockModelImpl.fromJson;

  @override
  List<MenuListItemModel> get menus;
  @override
  int get totalCount;
  @override
  @JsonKey(ignore: true)
  _$$MenuLimitStockModelImplCopyWith<_$MenuLimitStockModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
