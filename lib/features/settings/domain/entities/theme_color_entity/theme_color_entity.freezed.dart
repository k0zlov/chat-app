// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_color_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ThemeColorEntity {
  AppThemeColor get color => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThemeColorEntityCopyWith<ThemeColorEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeColorEntityCopyWith<$Res> {
  factory $ThemeColorEntityCopyWith(
          ThemeColorEntity value, $Res Function(ThemeColorEntity) then) =
      _$ThemeColorEntityCopyWithImpl<$Res, ThemeColorEntity>;
  @useResult
  $Res call({AppThemeColor color});
}

/// @nodoc
class _$ThemeColorEntityCopyWithImpl<$Res, $Val extends ThemeColorEntity>
    implements $ThemeColorEntityCopyWith<$Res> {
  _$ThemeColorEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as AppThemeColor,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThemeColorEntityImplCopyWith<$Res>
    implements $ThemeColorEntityCopyWith<$Res> {
  factory _$$ThemeColorEntityImplCopyWith(_$ThemeColorEntityImpl value,
          $Res Function(_$ThemeColorEntityImpl) then) =
      __$$ThemeColorEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AppThemeColor color});
}

/// @nodoc
class __$$ThemeColorEntityImplCopyWithImpl<$Res>
    extends _$ThemeColorEntityCopyWithImpl<$Res, _$ThemeColorEntityImpl>
    implements _$$ThemeColorEntityImplCopyWith<$Res> {
  __$$ThemeColorEntityImplCopyWithImpl(_$ThemeColorEntityImpl _value,
      $Res Function(_$ThemeColorEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
  }) {
    return _then(_$ThemeColorEntityImpl(
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as AppThemeColor,
    ));
  }
}

/// @nodoc

class _$ThemeColorEntityImpl extends _ThemeColorEntity {
  const _$ThemeColorEntityImpl({this.color = AppThemeColor.standard})
      : super._();

  @override
  @JsonKey()
  final AppThemeColor color;

  @override
  String toString() {
    return 'ThemeColorEntity(color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeColorEntityImpl &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(runtimeType, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeColorEntityImplCopyWith<_$ThemeColorEntityImpl> get copyWith =>
      __$$ThemeColorEntityImplCopyWithImpl<_$ThemeColorEntityImpl>(
          this, _$identity);
}

abstract class _ThemeColorEntity extends ThemeColorEntity {
  const factory _ThemeColorEntity({final AppThemeColor color}) =
      _$ThemeColorEntityImpl;
  const _ThemeColorEntity._() : super._();

  @override
  AppThemeColor get color;
  @override
  @JsonKey(ignore: true)
  _$$ThemeColorEntityImplCopyWith<_$ThemeColorEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
