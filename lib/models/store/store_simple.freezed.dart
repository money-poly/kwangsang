// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_simple.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StoreSimple _$StoreSimpleFromJson(Map<String, dynamic> json) {
  return _StoreSimple.fromJson(json);
}

/// @nodoc
mixin _$StoreSimple {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @LatLngSerializer()
  LatLng get latLng => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreSimpleCopyWith<StoreSimple> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreSimpleCopyWith<$Res> {
  factory $StoreSimpleCopyWith(
          StoreSimple value, $Res Function(StoreSimple) then) =
      _$StoreSimpleCopyWithImpl<$Res, StoreSimple>;
  @useResult
  $Res call({int id, String name, @LatLngSerializer() LatLng latLng});
}

/// @nodoc
class _$StoreSimpleCopyWithImpl<$Res, $Val extends StoreSimple>
    implements $StoreSimpleCopyWith<$Res> {
  _$StoreSimpleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? latLng = null,
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
      latLng: null == latLng
          ? _value.latLng
          : latLng // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoreSimpleImplCopyWith<$Res>
    implements $StoreSimpleCopyWith<$Res> {
  factory _$$StoreSimpleImplCopyWith(
          _$StoreSimpleImpl value, $Res Function(_$StoreSimpleImpl) then) =
      __$$StoreSimpleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, @LatLngSerializer() LatLng latLng});
}

/// @nodoc
class __$$StoreSimpleImplCopyWithImpl<$Res>
    extends _$StoreSimpleCopyWithImpl<$Res, _$StoreSimpleImpl>
    implements _$$StoreSimpleImplCopyWith<$Res> {
  __$$StoreSimpleImplCopyWithImpl(
      _$StoreSimpleImpl _value, $Res Function(_$StoreSimpleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? latLng = null,
  }) {
    return _then(_$StoreSimpleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      latLng: null == latLng
          ? _value.latLng
          : latLng // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoreSimpleImpl implements _StoreSimple {
  _$StoreSimpleImpl(
      {required this.id,
      required this.name,
      @LatLngSerializer() required this.latLng});

  factory _$StoreSimpleImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoreSimpleImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @LatLngSerializer()
  final LatLng latLng;

  @override
  String toString() {
    return 'StoreSimple(id: $id, name: $name, latLng: $latLng)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreSimpleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.latLng, latLng) || other.latLng == latLng));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, latLng);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreSimpleImplCopyWith<_$StoreSimpleImpl> get copyWith =>
      __$$StoreSimpleImplCopyWithImpl<_$StoreSimpleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoreSimpleImplToJson(
      this,
    );
  }
}

abstract class _StoreSimple implements StoreSimple {
  factory _StoreSimple(
      {required final int id,
      required final String name,
      @LatLngSerializer() required final LatLng latLng}) = _$StoreSimpleImpl;

  factory _StoreSimple.fromJson(Map<String, dynamic> json) =
      _$StoreSimpleImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @LatLngSerializer()
  LatLng get latLng;
  @override
  @JsonKey(ignore: true)
  _$$StoreSimpleImplCopyWith<_$StoreSimpleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
