// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_home_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StoreHome _$StoreHomeFromJson(Map<String, dynamic> json) {
  return _StoreHome.fromJson(json);
}

/// @nodoc
mixin _$StoreHome {
  String get name => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  @JsonKey(fromJson: Menu.fromHomeJson)
  Menu get menu => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreHomeCopyWith<StoreHome> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreHomeCopyWith<$Res> {
  factory $StoreHomeCopyWith(StoreHome value, $Res Function(StoreHome) then) =
      _$StoreHomeCopyWithImpl<$Res, StoreHome>;
  @useResult
  $Res call(
      {String name,
      String? category,
      @JsonKey(fromJson: Menu.fromHomeJson) Menu menu});

  $MenuCopyWith<$Res> get menu;
}

/// @nodoc
class _$StoreHomeCopyWithImpl<$Res, $Val extends StoreHome>
    implements $StoreHomeCopyWith<$Res> {
  _$StoreHomeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? category = freezed,
    Object? menu = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      menu: null == menu
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as Menu,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MenuCopyWith<$Res> get menu {
    return $MenuCopyWith<$Res>(_value.menu, (value) {
      return _then(_value.copyWith(menu: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StoreHomeImplCopyWith<$Res>
    implements $StoreHomeCopyWith<$Res> {
  factory _$$StoreHomeImplCopyWith(
          _$StoreHomeImpl value, $Res Function(_$StoreHomeImpl) then) =
      __$$StoreHomeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String? category,
      @JsonKey(fromJson: Menu.fromHomeJson) Menu menu});

  @override
  $MenuCopyWith<$Res> get menu;
}

/// @nodoc
class __$$StoreHomeImplCopyWithImpl<$Res>
    extends _$StoreHomeCopyWithImpl<$Res, _$StoreHomeImpl>
    implements _$$StoreHomeImplCopyWith<$Res> {
  __$$StoreHomeImplCopyWithImpl(
      _$StoreHomeImpl _value, $Res Function(_$StoreHomeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? category = freezed,
    Object? menu = null,
  }) {
    return _then(_$StoreHomeImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      menu: null == menu
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as Menu,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoreHomeImpl implements _StoreHome {
  _$StoreHomeImpl(
      {required this.name,
      this.category,
      @JsonKey(fromJson: Menu.fromHomeJson) required this.menu});

  factory _$StoreHomeImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoreHomeImplFromJson(json);

  @override
  final String name;
  @override
  final String? category;
  @override
  @JsonKey(fromJson: Menu.fromHomeJson)
  final Menu menu;

  @override
  String toString() {
    return 'StoreHome(name: $name, category: $category, menu: $menu)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreHomeImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.menu, menu) || other.menu == menu));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, category, menu);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreHomeImplCopyWith<_$StoreHomeImpl> get copyWith =>
      __$$StoreHomeImplCopyWithImpl<_$StoreHomeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoreHomeImplToJson(
      this,
    );
  }
}

abstract class _StoreHome implements StoreHome {
  factory _StoreHome(
          {required final String name,
          final String? category,
          @JsonKey(fromJson: Menu.fromHomeJson) required final Menu menu}) =
      _$StoreHomeImpl;

  factory _StoreHome.fromJson(Map<String, dynamic> json) =
      _$StoreHomeImpl.fromJson;

  @override
  String get name;
  @override
  String? get category;
  @override
  @JsonKey(fromJson: Menu.fromHomeJson)
  Menu get menu;
  @override
  @JsonKey(ignore: true)
  _$$StoreHomeImplCopyWith<_$StoreHomeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
