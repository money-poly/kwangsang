// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Store _$StoreFromJson(Map<String, dynamic> json) {
  return _Store.fromJson(json);
}

/// @nodoc
mixin _$Store {
  @JsonKey(name: 'storeName')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'menu')
  MenuSimple get maxDiscountMenu => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  List<Tag>? get tags => throw _privateConstructorUsedError;
  @JsonKey(name: 'storePictureUrl')
  String? get imgUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreCopyWith<Store> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreCopyWith<$Res> {
  factory $StoreCopyWith(Store value, $Res Function(Store) then) =
      _$StoreCopyWithImpl<$Res, Store>;
  @useResult
  $Res call(
      {@JsonKey(name: 'storeName') String name,
      @JsonKey(name: 'menu') MenuSimple maxDiscountMenu,
      String? description,
      String? category,
      List<Tag>? tags,
      @JsonKey(name: 'storePictureUrl') String? imgUrl});

  $MenuSimpleCopyWith<$Res> get maxDiscountMenu;
}

/// @nodoc
class _$StoreCopyWithImpl<$Res, $Val extends Store>
    implements $StoreCopyWith<$Res> {
  _$StoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? maxDiscountMenu = null,
    Object? description = freezed,
    Object? category = freezed,
    Object? tags = freezed,
    Object? imgUrl = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      maxDiscountMenu: null == maxDiscountMenu
          ? _value.maxDiscountMenu
          : maxDiscountMenu // ignore: cast_nullable_to_non_nullable
              as MenuSimple,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>?,
      imgUrl: freezed == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MenuSimpleCopyWith<$Res> get maxDiscountMenu {
    return $MenuSimpleCopyWith<$Res>(_value.maxDiscountMenu, (value) {
      return _then(_value.copyWith(maxDiscountMenu: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StoreImplCopyWith<$Res> implements $StoreCopyWith<$Res> {
  factory _$$StoreImplCopyWith(
          _$StoreImpl value, $Res Function(_$StoreImpl) then) =
      __$$StoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'storeName') String name,
      @JsonKey(name: 'menu') MenuSimple maxDiscountMenu,
      String? description,
      String? category,
      List<Tag>? tags,
      @JsonKey(name: 'storePictureUrl') String? imgUrl});

  @override
  $MenuSimpleCopyWith<$Res> get maxDiscountMenu;
}

/// @nodoc
class __$$StoreImplCopyWithImpl<$Res>
    extends _$StoreCopyWithImpl<$Res, _$StoreImpl>
    implements _$$StoreImplCopyWith<$Res> {
  __$$StoreImplCopyWithImpl(
      _$StoreImpl _value, $Res Function(_$StoreImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? maxDiscountMenu = null,
    Object? description = freezed,
    Object? category = freezed,
    Object? tags = freezed,
    Object? imgUrl = freezed,
  }) {
    return _then(_$StoreImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      maxDiscountMenu: null == maxDiscountMenu
          ? _value.maxDiscountMenu
          : maxDiscountMenu // ignore: cast_nullable_to_non_nullable
              as MenuSimple,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>?,
      imgUrl: freezed == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoreImpl implements _Store {
  _$StoreImpl(
      {@JsonKey(name: 'storeName') required this.name,
      @JsonKey(name: 'menu') required this.maxDiscountMenu,
      this.description,
      this.category,
      final List<Tag>? tags,
      @JsonKey(name: 'storePictureUrl') this.imgUrl})
      : _tags = tags;

  factory _$StoreImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoreImplFromJson(json);

  @override
  @JsonKey(name: 'storeName')
  final String name;
  @override
  @JsonKey(name: 'menu')
  final MenuSimple maxDiscountMenu;
  @override
  final String? description;
  @override
  final String? category;
  final List<Tag>? _tags;
  @override
  List<Tag>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'storePictureUrl')
  final String? imgUrl;

  @override
  String toString() {
    return 'Store(name: $name, maxDiscountMenu: $maxDiscountMenu, description: $description, category: $category, tags: $tags, imgUrl: $imgUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.maxDiscountMenu, maxDiscountMenu) ||
                other.maxDiscountMenu == maxDiscountMenu) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      maxDiscountMenu,
      description,
      category,
      const DeepCollectionEquality().hash(_tags),
      imgUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreImplCopyWith<_$StoreImpl> get copyWith =>
      __$$StoreImplCopyWithImpl<_$StoreImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoreImplToJson(
      this,
    );
  }
}

abstract class _Store implements Store {
  factory _Store(
      {@JsonKey(name: 'storeName') required final String name,
      @JsonKey(name: 'menu') required final MenuSimple maxDiscountMenu,
      final String? description,
      final String? category,
      final List<Tag>? tags,
      @JsonKey(name: 'storePictureUrl') final String? imgUrl}) = _$StoreImpl;

  factory _Store.fromJson(Map<String, dynamic> json) = _$StoreImpl.fromJson;

  @override
  @JsonKey(name: 'storeName')
  String get name;
  @override
  @JsonKey(name: 'menu')
  MenuSimple get maxDiscountMenu;
  @override
  String? get description;
  @override
  String? get category;
  @override
  List<Tag>? get tags;
  @override
  @JsonKey(name: 'storePictureUrl')
  String? get imgUrl;
  @override
  @JsonKey(ignore: true)
  _$$StoreImplCopyWith<_$StoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
