// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_color_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ThemeColorModel {
  String get colorName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThemeColorModelCopyWith<ThemeColorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeColorModelCopyWith<$Res> {
  factory $ThemeColorModelCopyWith(
          ThemeColorModel value, $Res Function(ThemeColorModel) then) =
      _$ThemeColorModelCopyWithImpl<$Res, ThemeColorModel>;
  @useResult
  $Res call({String colorName});
}

/// @nodoc
class _$ThemeColorModelCopyWithImpl<$Res, $Val extends ThemeColorModel>
    implements $ThemeColorModelCopyWith<$Res> {
  _$ThemeColorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colorName = null,
  }) {
    return _then(_value.copyWith(
      colorName: null == colorName
          ? _value.colorName
          : colorName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThemeColorModelImplCopyWith<$Res>
    implements $ThemeColorModelCopyWith<$Res> {
  factory _$$ThemeColorModelImplCopyWith(_$ThemeColorModelImpl value,
          $Res Function(_$ThemeColorModelImpl) then) =
      __$$ThemeColorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String colorName});
}

/// @nodoc
class __$$ThemeColorModelImplCopyWithImpl<$Res>
    extends _$ThemeColorModelCopyWithImpl<$Res, _$ThemeColorModelImpl>
    implements _$$ThemeColorModelImplCopyWith<$Res> {
  __$$ThemeColorModelImplCopyWithImpl(
      _$ThemeColorModelImpl _value, $Res Function(_$ThemeColorModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colorName = null,
  }) {
    return _then(_$ThemeColorModelImpl(
      colorName: null == colorName
          ? _value.colorName
          : colorName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ThemeColorModelImpl extends _ThemeColorModel {
  const _$ThemeColorModelImpl({this.colorName = 'standard'}) : super._();

  @override
  @JsonKey()
  final String colorName;

  @override
  String toString() {
    return 'ThemeColorModel(colorName: $colorName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeColorModelImpl &&
            (identical(other.colorName, colorName) ||
                other.colorName == colorName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, colorName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeColorModelImplCopyWith<_$ThemeColorModelImpl> get copyWith =>
      __$$ThemeColorModelImplCopyWithImpl<_$ThemeColorModelImpl>(
          this, _$identity);
}

abstract class _ThemeColorModel extends ThemeColorModel {
  const factory _ThemeColorModel({final String colorName}) =
      _$ThemeColorModelImpl;
  const _ThemeColorModel._() : super._();

  @override
  String get colorName;
  @override
  @JsonKey(ignore: true)
  _$$ThemeColorModelImplCopyWith<_$ThemeColorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
