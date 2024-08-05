// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_new_product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MenuNewProductModel _$MenuNewProductModelFromJson(Map<String, dynamic> json) {
  return _MenuNewProductModel.fromJson(json);
}

/// @nodoc
mixin _$MenuNewProductModel {
  DateTime get saleTime => throw _privateConstructorUsedError;
  List<MenuNewProductStoreItemModel> get stores =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuNewProductModelCopyWith<MenuNewProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuNewProductModelCopyWith<$Res> {
  factory $MenuNewProductModelCopyWith(
          MenuNewProductModel value, $Res Function(MenuNewProductModel) then) =
      _$MenuNewProductModelCopyWithImpl<$Res, MenuNewProductModel>;
  @useResult
  $Res call({DateTime saleTime, List<MenuNewProductStoreItemModel> stores});
}

/// @nodoc
class _$MenuNewProductModelCopyWithImpl<$Res, $Val extends MenuNewProductModel>
    implements $MenuNewProductModelCopyWith<$Res> {
  _$MenuNewProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saleTime = null,
    Object? stores = null,
  }) {
    return _then(_value.copyWith(
      saleTime: null == saleTime
          ? _value.saleTime
          : saleTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      stores: null == stores
          ? _value.stores
          : stores // ignore: cast_nullable_to_non_nullable
              as List<MenuNewProductStoreItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuNewProductModelImplCopyWith<$Res>
    implements $MenuNewProductModelCopyWith<$Res> {
  factory _$$MenuNewProductModelImplCopyWith(_$MenuNewProductModelImpl value,
          $Res Function(_$MenuNewProductModelImpl) then) =
      __$$MenuNewProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime saleTime, List<MenuNewProductStoreItemModel> stores});
}

/// @nodoc
class __$$MenuNewProductModelImplCopyWithImpl<$Res>
    extends _$MenuNewProductModelCopyWithImpl<$Res, _$MenuNewProductModelImpl>
    implements _$$MenuNewProductModelImplCopyWith<$Res> {
  __$$MenuNewProductModelImplCopyWithImpl(_$MenuNewProductModelImpl _value,
      $Res Function(_$MenuNewProductModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saleTime = null,
    Object? stores = null,
  }) {
    return _then(_$MenuNewProductModelImpl(
      saleTime: null == saleTime
          ? _value.saleTime
          : saleTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      stores: null == stores
          ? _value._stores
          : stores // ignore: cast_nullable_to_non_nullable
              as List<MenuNewProductStoreItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuNewProductModelImpl implements _MenuNewProductModel {
  _$MenuNewProductModelImpl(
      {required this.saleTime,
      required final List<MenuNewProductStoreItemModel> stores})
      : _stores = stores;

  factory _$MenuNewProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuNewProductModelImplFromJson(json);

  @override
  final DateTime saleTime;
  final List<MenuNewProductStoreItemModel> _stores;
  @override
  List<MenuNewProductStoreItemModel> get stores {
    if (_stores is EqualUnmodifiableListView) return _stores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stores);
  }

  @override
  String toString() {
    return 'MenuNewProductModel(saleTime: $saleTime, stores: $stores)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuNewProductModelImpl &&
            (identical(other.saleTime, saleTime) ||
                other.saleTime == saleTime) &&
            const DeepCollectionEquality().equals(other._stores, _stores));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, saleTime, const DeepCollectionEquality().hash(_stores));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuNewProductModelImplCopyWith<_$MenuNewProductModelImpl> get copyWith =>
      __$$MenuNewProductModelImplCopyWithImpl<_$MenuNewProductModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuNewProductModelImplToJson(
      this,
    );
  }
}

abstract class _MenuNewProductModel implements MenuNewProductModel {
  factory _MenuNewProductModel(
          {required final DateTime saleTime,
          required final List<MenuNewProductStoreItemModel> stores}) =
      _$MenuNewProductModelImpl;

  factory _MenuNewProductModel.fromJson(Map<String, dynamic> json) =
      _$MenuNewProductModelImpl.fromJson;

  @override
  DateTime get saleTime;
  @override
  List<MenuNewProductStoreItemModel> get stores;
  @override
  @JsonKey(ignore: true)
  _$$MenuNewProductModelImplCopyWith<_$MenuNewProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MenuNewProductStoreItemModel _$MenuNewProductStoreItemModelFromJson(
    Map<String, dynamic> json) {
  return _MenuNewProductStoreItemModel.fromJson(json);
}

/// @nodoc
mixin _$MenuNewProductStoreItemModel {
  Store get store => throw _privateConstructorUsedError;
  List<Menu> get menus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuNewProductStoreItemModelCopyWith<MenuNewProductStoreItemModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuNewProductStoreItemModelCopyWith<$Res> {
  factory $MenuNewProductStoreItemModelCopyWith(
          MenuNewProductStoreItemModel value,
          $Res Function(MenuNewProductStoreItemModel) then) =
      _$MenuNewProductStoreItemModelCopyWithImpl<$Res,
          MenuNewProductStoreItemModel>;
  @useResult
  $Res call({Store store, List<Menu> menus});

  $StoreCopyWith<$Res> get store;
}

/// @nodoc
class _$MenuNewProductStoreItemModelCopyWithImpl<$Res,
        $Val extends MenuNewProductStoreItemModel>
    implements $MenuNewProductStoreItemModelCopyWith<$Res> {
  _$MenuNewProductStoreItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? store = null,
    Object? menus = null,
  }) {
    return _then(_value.copyWith(
      store: null == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store,
      menus: null == menus
          ? _value.menus
          : menus // ignore: cast_nullable_to_non_nullable
              as List<Menu>,
    ) as $Val);
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
abstract class _$$MenuNewProductStoreItemModelImplCopyWith<$Res>
    implements $MenuNewProductStoreItemModelCopyWith<$Res> {
  factory _$$MenuNewProductStoreItemModelImplCopyWith(
          _$MenuNewProductStoreItemModelImpl value,
          $Res Function(_$MenuNewProductStoreItemModelImpl) then) =
      __$$MenuNewProductStoreItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Store store, List<Menu> menus});

  @override
  $StoreCopyWith<$Res> get store;
}

/// @nodoc
class __$$MenuNewProductStoreItemModelImplCopyWithImpl<$Res>
    extends _$MenuNewProductStoreItemModelCopyWithImpl<$Res,
        _$MenuNewProductStoreItemModelImpl>
    implements _$$MenuNewProductStoreItemModelImplCopyWith<$Res> {
  __$$MenuNewProductStoreItemModelImplCopyWithImpl(
      _$MenuNewProductStoreItemModelImpl _value,
      $Res Function(_$MenuNewProductStoreItemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? store = null,
    Object? menus = null,
  }) {
    return _then(_$MenuNewProductStoreItemModelImpl(
      store: null == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store,
      menus: null == menus
          ? _value._menus
          : menus // ignore: cast_nullable_to_non_nullable
              as List<Menu>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuNewProductStoreItemModelImpl
    implements _MenuNewProductStoreItemModel {
  _$MenuNewProductStoreItemModelImpl(
      {required this.store, required final List<Menu> menus})
      : _menus = menus;

  factory _$MenuNewProductStoreItemModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MenuNewProductStoreItemModelImplFromJson(json);

  @override
  final Store store;
  final List<Menu> _menus;
  @override
  List<Menu> get menus {
    if (_menus is EqualUnmodifiableListView) return _menus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_menus);
  }

  @override
  String toString() {
    return 'MenuNewProductStoreItemModel(store: $store, menus: $menus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuNewProductStoreItemModelImpl &&
            (identical(other.store, store) || other.store == store) &&
            const DeepCollectionEquality().equals(other._menus, _menus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, store, const DeepCollectionEquality().hash(_menus));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuNewProductStoreItemModelImplCopyWith<
          _$MenuNewProductStoreItemModelImpl>
      get copyWith => __$$MenuNewProductStoreItemModelImplCopyWithImpl<
          _$MenuNewProductStoreItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuNewProductStoreItemModelImplToJson(
      this,
    );
  }
}

abstract class _MenuNewProductStoreItemModel
    implements MenuNewProductStoreItemModel {
  factory _MenuNewProductStoreItemModel(
      {required final Store store,
      required final List<Menu> menus}) = _$MenuNewProductStoreItemModelImpl;

  factory _MenuNewProductStoreItemModel.fromJson(Map<String, dynamic> json) =
      _$MenuNewProductStoreItemModelImpl.fromJson;

  @override
  Store get store;
  @override
  List<Menu> get menus;
  @override
  @JsonKey(ignore: true)
  _$$MenuNewProductStoreItemModelImplCopyWith<
          _$MenuNewProductStoreItemModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
