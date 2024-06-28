// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Menu _$MenuFromJson(Map<String, dynamic> json) {
  return _Menu.fromJson(json);
}

/// @nodoc
mixin _$Menu {
  @JsonKey(name: 'menuId')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'menuName')
  String get name => throw _privateConstructorUsedError;
  int get discountRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'sellingPrice')
  int get discountPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  int? get regularPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'menuPictureUrl')
  String? get imgUrl => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'storeName')
  String? get store => throw _privateConstructorUsedError;
  @ViewSerializer()
  int? get view => throw _privateConstructorUsedError;
  List<Tag>? get tags => throw _privateConstructorUsedError;
  List<Origin>? get origins => throw _privateConstructorUsedError;
  MenuStatus? get status => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;
  DateTime? get expiredDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuCopyWith<Menu> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuCopyWith<$Res> {
  factory $MenuCopyWith(Menu value, $Res Function(Menu) then) =
      _$MenuCopyWithImpl<$Res, Menu>;
  @useResult
  $Res call(
      {@JsonKey(name: 'menuId') int id,
      @JsonKey(name: 'menuName') String name,
      int discountRate,
      @JsonKey(name: 'sellingPrice') int discountPrice,
      @JsonKey(name: 'price') int? regularPrice,
      @JsonKey(name: 'menuPictureUrl') String? imgUrl,
      String? description,
      @JsonKey(name: 'storeName') String? store,
      @ViewSerializer() int? view,
      List<Tag>? tags,
      List<Origin>? origins,
      MenuStatus? status,
      int? count,
      DateTime? expiredDate});
}

/// @nodoc
class _$MenuCopyWithImpl<$Res, $Val extends Menu>
    implements $MenuCopyWith<$Res> {
  _$MenuCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? discountRate = null,
    Object? discountPrice = null,
    Object? regularPrice = freezed,
    Object? imgUrl = freezed,
    Object? description = freezed,
    Object? store = freezed,
    Object? view = freezed,
    Object? tags = freezed,
    Object? origins = freezed,
    Object? status = freezed,
    Object? count = freezed,
    Object? expiredDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      discountRate: null == discountRate
          ? _value.discountRate
          : discountRate // ignore: cast_nullable_to_non_nullable
              as int,
      discountPrice: null == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as int,
      regularPrice: freezed == regularPrice
          ? _value.regularPrice
          : regularPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      imgUrl: freezed == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      store: freezed == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as String?,
      view: freezed == view
          ? _value.view
          : view // ignore: cast_nullable_to_non_nullable
              as int?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>?,
      origins: freezed == origins
          ? _value.origins
          : origins // ignore: cast_nullable_to_non_nullable
              as List<Origin>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MenuStatus?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      expiredDate: freezed == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuImplCopyWith<$Res> implements $MenuCopyWith<$Res> {
  factory _$$MenuImplCopyWith(
          _$MenuImpl value, $Res Function(_$MenuImpl) then) =
      __$$MenuImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'menuId') int id,
      @JsonKey(name: 'menuName') String name,
      int discountRate,
      @JsonKey(name: 'sellingPrice') int discountPrice,
      @JsonKey(name: 'price') int? regularPrice,
      @JsonKey(name: 'menuPictureUrl') String? imgUrl,
      String? description,
      @JsonKey(name: 'storeName') String? store,
      @ViewSerializer() int? view,
      List<Tag>? tags,
      List<Origin>? origins,
      MenuStatus? status,
      int? count,
      DateTime? expiredDate});
}

/// @nodoc
class __$$MenuImplCopyWithImpl<$Res>
    extends _$MenuCopyWithImpl<$Res, _$MenuImpl>
    implements _$$MenuImplCopyWith<$Res> {
  __$$MenuImplCopyWithImpl(_$MenuImpl _value, $Res Function(_$MenuImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? discountRate = null,
    Object? discountPrice = null,
    Object? regularPrice = freezed,
    Object? imgUrl = freezed,
    Object? description = freezed,
    Object? store = freezed,
    Object? view = freezed,
    Object? tags = freezed,
    Object? origins = freezed,
    Object? status = freezed,
    Object? count = freezed,
    Object? expiredDate = freezed,
  }) {
    return _then(_$MenuImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      discountRate: null == discountRate
          ? _value.discountRate
          : discountRate // ignore: cast_nullable_to_non_nullable
              as int,
      discountPrice: null == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as int,
      regularPrice: freezed == regularPrice
          ? _value.regularPrice
          : regularPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      imgUrl: freezed == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      store: freezed == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as String?,
      view: freezed == view
          ? _value.view
          : view // ignore: cast_nullable_to_non_nullable
              as int?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>?,
      origins: freezed == origins
          ? _value._origins
          : origins // ignore: cast_nullable_to_non_nullable
              as List<Origin>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MenuStatus?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      expiredDate: freezed == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuImpl implements _Menu {
  _$MenuImpl(
      {@JsonKey(name: 'menuId') required this.id,
      @JsonKey(name: 'menuName') required this.name,
      required this.discountRate,
      @JsonKey(name: 'sellingPrice') required this.discountPrice,
      @JsonKey(name: 'price') this.regularPrice,
      @JsonKey(name: 'menuPictureUrl') this.imgUrl,
      this.description,
      @JsonKey(name: 'storeName') this.store,
      @ViewSerializer() this.view,
      final List<Tag>? tags,
      final List<Origin>? origins,
      this.status,
      this.count,
      this.expiredDate})
      : _tags = tags,
        _origins = origins;

  factory _$MenuImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuImplFromJson(json);

  @override
  @JsonKey(name: 'menuId')
  final int id;
  @override
  @JsonKey(name: 'menuName')
  final String name;
  @override
  final int discountRate;
  @override
  @JsonKey(name: 'sellingPrice')
  final int discountPrice;
  @override
  @JsonKey(name: 'price')
  final int? regularPrice;
  @override
  @JsonKey(name: 'menuPictureUrl')
  final String? imgUrl;
  @override
  final String? description;
  @override
  @JsonKey(name: 'storeName')
  final String? store;
  @override
  @ViewSerializer()
  final int? view;
  final List<Tag>? _tags;
  @override
  List<Tag>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Origin>? _origins;
  @override
  List<Origin>? get origins {
    final value = _origins;
    if (value == null) return null;
    if (_origins is EqualUnmodifiableListView) return _origins;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final MenuStatus? status;
  @override
  final int? count;
  @override
  final DateTime? expiredDate;

  @override
  String toString() {
    return 'Menu(id: $id, name: $name, discountRate: $discountRate, discountPrice: $discountPrice, regularPrice: $regularPrice, imgUrl: $imgUrl, description: $description, store: $store, view: $view, tags: $tags, origins: $origins, status: $status, count: $count, expiredDate: $expiredDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.discountRate, discountRate) ||
                other.discountRate == discountRate) &&
            (identical(other.discountPrice, discountPrice) ||
                other.discountPrice == discountPrice) &&
            (identical(other.regularPrice, regularPrice) ||
                other.regularPrice == regularPrice) &&
            (identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.store, store) || other.store == store) &&
            (identical(other.view, view) || other.view == view) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other._origins, _origins) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.expiredDate, expiredDate) ||
                other.expiredDate == expiredDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      discountRate,
      discountPrice,
      regularPrice,
      imgUrl,
      description,
      store,
      view,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_origins),
      status,
      count,
      expiredDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuImplCopyWith<_$MenuImpl> get copyWith =>
      __$$MenuImplCopyWithImpl<_$MenuImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuImplToJson(
      this,
    );
  }
}

abstract class _Menu implements Menu {
  factory _Menu(
      {@JsonKey(name: 'menuId') required final int id,
      @JsonKey(name: 'menuName') required final String name,
      required final int discountRate,
      @JsonKey(name: 'sellingPrice') required final int discountPrice,
      @JsonKey(name: 'price') final int? regularPrice,
      @JsonKey(name: 'menuPictureUrl') final String? imgUrl,
      final String? description,
      @JsonKey(name: 'storeName') final String? store,
      @ViewSerializer() final int? view,
      final List<Tag>? tags,
      final List<Origin>? origins,
      final MenuStatus? status,
      final int? count,
      final DateTime? expiredDate}) = _$MenuImpl;

  factory _Menu.fromJson(Map<String, dynamic> json) = _$MenuImpl.fromJson;

  @override
  @JsonKey(name: 'menuId')
  int get id;
  @override
  @JsonKey(name: 'menuName')
  String get name;
  @override
  int get discountRate;
  @override
  @JsonKey(name: 'sellingPrice')
  int get discountPrice;
  @override
  @JsonKey(name: 'price')
  int? get regularPrice;
  @override
  @JsonKey(name: 'menuPictureUrl')
  String? get imgUrl;
  @override
  String? get description;
  @override
  @JsonKey(name: 'storeName')
  String? get store;
  @override
  @ViewSerializer()
  int? get view;
  @override
  List<Tag>? get tags;
  @override
  List<Origin>? get origins;
  @override
  MenuStatus? get status;
  @override
  int? get count;
  @override
  DateTime? get expiredDate;
  @override
  @JsonKey(ignore: true)
  _$$MenuImplCopyWith<_$MenuImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
