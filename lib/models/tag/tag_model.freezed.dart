// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tag_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Tag _$TagFromJson(Map<String, dynamic> json) {
  return _Tag.fromJson(json);
}

/// @nodoc
mixin _$Tag {
  String get icon => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(fromJson: hexToColor, toJson: colorToHex)
  Color get txtColor => throw _privateConstructorUsedError;
  @JsonKey(fromJson: hexToColor, toJson: colorToHex)
  Color get bgColor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TagCopyWith<Tag> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagCopyWith<$Res> {
  factory $TagCopyWith(Tag value, $Res Function(Tag) then) =
      _$TagCopyWithImpl<$Res, Tag>;
  @useResult
  $Res call(
      {String icon,
      String name,
      @JsonKey(fromJson: hexToColor, toJson: colorToHex) Color txtColor,
      @JsonKey(fromJson: hexToColor, toJson: colorToHex) Color bgColor});
}

/// @nodoc
class _$TagCopyWithImpl<$Res, $Val extends Tag> implements $TagCopyWith<$Res> {
  _$TagCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = null,
    Object? name = null,
    Object? txtColor = null,
    Object? bgColor = null,
  }) {
    return _then(_value.copyWith(
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      txtColor: null == txtColor
          ? _value.txtColor
          : txtColor // ignore: cast_nullable_to_non_nullable
              as Color,
      bgColor: null == bgColor
          ? _value.bgColor
          : bgColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TagImplCopyWith<$Res> implements $TagCopyWith<$Res> {
  factory _$$TagImplCopyWith(_$TagImpl value, $Res Function(_$TagImpl) then) =
      __$$TagImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String icon,
      String name,
      @JsonKey(fromJson: hexToColor, toJson: colorToHex) Color txtColor,
      @JsonKey(fromJson: hexToColor, toJson: colorToHex) Color bgColor});
}

/// @nodoc
class __$$TagImplCopyWithImpl<$Res> extends _$TagCopyWithImpl<$Res, _$TagImpl>
    implements _$$TagImplCopyWith<$Res> {
  __$$TagImplCopyWithImpl(_$TagImpl _value, $Res Function(_$TagImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = null,
    Object? name = null,
    Object? txtColor = null,
    Object? bgColor = null,
  }) {
    return _then(_$TagImpl(
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      txtColor: null == txtColor
          ? _value.txtColor
          : txtColor // ignore: cast_nullable_to_non_nullable
              as Color,
      bgColor: null == bgColor
          ? _value.bgColor
          : bgColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TagImpl implements _Tag {
  _$TagImpl(
      {this.icon = 'time',
      required this.name,
      @JsonKey(fromJson: hexToColor, toJson: colorToHex) required this.txtColor,
      @JsonKey(fromJson: hexToColor, toJson: colorToHex)
      required this.bgColor});

  factory _$TagImpl.fromJson(Map<String, dynamic> json) =>
      _$$TagImplFromJson(json);

  @override
  @JsonKey()
  final String icon;
  @override
  final String name;
  @override
  @JsonKey(fromJson: hexToColor, toJson: colorToHex)
  final Color txtColor;
  @override
  @JsonKey(fromJson: hexToColor, toJson: colorToHex)
  final Color bgColor;

  @override
  String toString() {
    return 'Tag(icon: $icon, name: $name, txtColor: $txtColor, bgColor: $bgColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TagImpl &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.txtColor, txtColor) ||
                other.txtColor == txtColor) &&
            (identical(other.bgColor, bgColor) || other.bgColor == bgColor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, icon, name, txtColor, bgColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TagImplCopyWith<_$TagImpl> get copyWith =>
      __$$TagImplCopyWithImpl<_$TagImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TagImplToJson(
      this,
    );
  }
}

abstract class _Tag implements Tag {
  factory _Tag(
      {final String icon,
      required final String name,
      @JsonKey(fromJson: hexToColor, toJson: colorToHex)
      required final Color txtColor,
      @JsonKey(fromJson: hexToColor, toJson: colorToHex)
      required final Color bgColor}) = _$TagImpl;

  factory _Tag.fromJson(Map<String, dynamic> json) = _$TagImpl.fromJson;

  @override
  String get icon;
  @override
  String get name;
  @override
  @JsonKey(fromJson: hexToColor, toJson: colorToHex)
  Color get txtColor;
  @override
  @JsonKey(fromJson: hexToColor, toJson: colorToHex)
  Color get bgColor;
  @override
  @JsonKey(ignore: true)
  _$$TagImplCopyWith<_$TagImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
