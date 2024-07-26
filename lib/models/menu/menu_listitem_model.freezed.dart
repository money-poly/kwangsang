// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_listitem_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MenuListItemModel _$MenuListItemModelFromJson(Map<String, dynamic> json) {
  return _MenuListItemModel.fromJson(json);
}

/// @nodoc
mixin _$MenuListItemModel {
  Menu get menu => throw _privateConstructorUsedError;
  Store get store => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MenuListItemModelCopyWith<MenuListItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuListItemModelCopyWith<$Res> {
  factory $MenuListItemModelCopyWith(
          MenuListItemModel value, $Res Function(MenuListItemModel) then) =
      _$MenuListItemModelCopyWithImpl<$Res, MenuListItemModel>;
  @useResult
  $Res call({Menu menu, Store store});

  $MenuCopyWith<$Res> get menu;
  $StoreCopyWith<$Res> get store;
}

/// @nodoc
class _$MenuListItemModelCopyWithImpl<$Res, $Val extends MenuListItemModel>
    implements $MenuListItemModelCopyWith<$Res> {
  _$MenuListItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menu = null,
    Object? store = null,
  }) {
    return _then(_value.copyWith(
      menu: null == menu
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as Menu,
      store: null == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MenuCopyWith<$Res> get menu {
    return $MenuCopyWith<$Res>(_value.menu, (value) {
      return _then(_value.copyWith(menu: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StoreCopyWith<$Res> get store {
    return $StoreCopyWith<$Res>(_value.store, (value) {
      return _then(_value.copyWith(store: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MenuListItemModelImplCopyWith<$Res>
    implements $MenuListItemModelCopyWith<$Res> {
  factory _$$MenuListItemModelImplCopyWith(_$MenuListItemModelImpl value,
          $Res Function(_$MenuListItemModelImpl) then) =
      __$$MenuListItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Menu menu, Store store});

  @override
  $MenuCopyWith<$Res> get menu;
  @override
  $StoreCopyWith<$Res> get store;
}

/// @nodoc
class __$$MenuListItemModelImplCopyWithImpl<$Res>
    extends _$MenuListItemModelCopyWithImpl<$Res, _$MenuListItemModelImpl>
    implements _$$MenuListItemModelImplCopyWith<$Res> {
  __$$MenuListItemModelImplCopyWithImpl(_$MenuListItemModelImpl _value,
      $Res Function(_$MenuListItemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menu = null,
    Object? store = null,
  }) {
    return _then(_$MenuListItemModelImpl(
      menu: null == menu
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as Menu,
      store: null == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$MenuListItemModelImpl implements _MenuListItemModel {
  _$MenuListItemModelImpl({required this.menu, required this.store});

  factory _$MenuListItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuListItemModelImplFromJson(json);

  @override
  final Menu menu;
  @override
  final Store store;

  @override
  String toString() {
    return 'MenuListItemModel(menu: $menu, store: $store)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuListItemModelImpl &&
            (identical(other.menu, menu) || other.menu == menu) &&
            (identical(other.store, store) || other.store == store));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, menu, store);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuListItemModelImplCopyWith<_$MenuListItemModelImpl> get copyWith =>
      __$$MenuListItemModelImplCopyWithImpl<_$MenuListItemModelImpl>(
          this, _$identity);
}

abstract class _MenuListItemModel implements MenuListItemModel {
  factory _MenuListItemModel(
      {required final Menu menu,
      required final Store store}) = _$MenuListItemModelImpl;

  factory _MenuListItemModel.fromJson(Map<String, dynamic> json) =
      _$MenuListItemModelImpl.fromJson;

  @override
  Menu get menu;
  @override
  Store get store;
  @override
  @JsonKey(ignore: true)
  _$$MenuListItemModelImplCopyWith<_$MenuListItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
