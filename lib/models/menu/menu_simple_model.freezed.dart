// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_simple_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MenuSimple _$MenuSimpleFromJson(Map<String, dynamic> json) {
  return _MenuSimple.fromJson(json);
}

/// @nodoc
mixin _$MenuSimple {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get originPrice => throw _privateConstructorUsedError;
  int? get discountPrice => throw _privateConstructorUsedError;
  int get discountRate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuSimpleCopyWith<MenuSimple> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuSimpleCopyWith<$Res> {
  factory $MenuSimpleCopyWith(
          MenuSimple value, $Res Function(MenuSimple) then) =
      _$MenuSimpleCopyWithImpl<$Res, MenuSimple>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      int? originPrice,
      int? discountPrice,
      int discountRate});
}

/// @nodoc
class _$MenuSimpleCopyWithImpl<$Res, $Val extends MenuSimple>
    implements $MenuSimpleCopyWith<$Res> {
  _$MenuSimpleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? originPrice = freezed,
    Object? discountPrice = freezed,
    Object? discountRate = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      originPrice: freezed == originPrice
          ? _value.originPrice
          : originPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      discountPrice: freezed == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      discountRate: null == discountRate
          ? _value.discountRate
          : discountRate // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuSimpleImplCopyWith<$Res>
    implements $MenuSimpleCopyWith<$Res> {
  factory _$$MenuSimpleImplCopyWith(
          _$MenuSimpleImpl value, $Res Function(_$MenuSimpleImpl) then) =
      __$$MenuSimpleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      int? originPrice,
      int? discountPrice,
      int discountRate});
}

/// @nodoc
class __$$MenuSimpleImplCopyWithImpl<$Res>
    extends _$MenuSimpleCopyWithImpl<$Res, _$MenuSimpleImpl>
    implements _$$MenuSimpleImplCopyWith<$Res> {
  __$$MenuSimpleImplCopyWithImpl(
      _$MenuSimpleImpl _value, $Res Function(_$MenuSimpleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? originPrice = freezed,
    Object? discountPrice = freezed,
    Object? discountRate = null,
  }) {
    return _then(_$MenuSimpleImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      originPrice: freezed == originPrice
          ? _value.originPrice
          : originPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      discountPrice: freezed == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      discountRate: null == discountRate
          ? _value.discountRate
          : discountRate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuSimpleImpl implements _MenuSimple {
  _$MenuSimpleImpl(
      {this.id,
      this.name,
      this.originPrice,
      this.discountPrice,
      required this.discountRate});

  factory _$MenuSimpleImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuSimpleImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final int? originPrice;
  @override
  final int? discountPrice;
  @override
  final int discountRate;

  @override
  String toString() {
    return 'MenuSimple(id: $id, name: $name, originPrice: $originPrice, discountPrice: $discountPrice, discountRate: $discountRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuSimpleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.originPrice, originPrice) ||
                other.originPrice == originPrice) &&
            (identical(other.discountPrice, discountPrice) ||
                other.discountPrice == discountPrice) &&
            (identical(other.discountRate, discountRate) ||
                other.discountRate == discountRate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, originPrice, discountPrice, discountRate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuSimpleImplCopyWith<_$MenuSimpleImpl> get copyWith =>
      __$$MenuSimpleImplCopyWithImpl<_$MenuSimpleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuSimpleImplToJson(
      this,
    );
  }
}

abstract class _MenuSimple implements MenuSimple {
  factory _MenuSimple(
      {final int? id,
      final String? name,
      final int? originPrice,
      final int? discountPrice,
      required final int discountRate}) = _$MenuSimpleImpl;

  factory _MenuSimple.fromJson(Map<String, dynamic> json) =
      _$MenuSimpleImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  int? get originPrice;
  @override
  int? get discountPrice;
  @override
  int get discountRate;
  @override
  @JsonKey(ignore: true)
  _$$MenuSimpleImplCopyWith<_$MenuSimpleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
