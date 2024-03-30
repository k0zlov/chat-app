// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_mode_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ThemeModeEntity {
  Brightness get mode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThemeModeEntityCopyWith<ThemeModeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeModeEntityCopyWith<$Res> {
  factory $ThemeModeEntityCopyWith(
          ThemeModeEntity value, $Res Function(ThemeModeEntity) then) =
      _$ThemeModeEntityCopyWithImpl<$Res, ThemeModeEntity>;
  @useResult
  $Res call({Brightness mode});
}

/// @nodoc
class _$ThemeModeEntityCopyWithImpl<$Res, $Val extends ThemeModeEntity>
    implements $ThemeModeEntityCopyWith<$Res> {
  _$ThemeModeEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
  }) {
    return _then(_value.copyWith(
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as Brightness,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThemeModeEntityImplCopyWith<$Res>
    implements $ThemeModeEntityCopyWith<$Res> {
  factory _$$ThemeModeEntityImplCopyWith(_$ThemeModeEntityImpl value,
          $Res Function(_$ThemeModeEntityImpl) then) =
      __$$ThemeModeEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Brightness mode});
}

/// @nodoc
class __$$ThemeModeEntityImplCopyWithImpl<$Res>
    extends _$ThemeModeEntityCopyWithImpl<$Res, _$ThemeModeEntityImpl>
    implements _$$ThemeModeEntityImplCopyWith<$Res> {
  __$$ThemeModeEntityImplCopyWithImpl(
      _$ThemeModeEntityImpl _value, $Res Function(_$ThemeModeEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
  }) {
    return _then(_$ThemeModeEntityImpl(
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as Brightness,
    ));
  }
}

/// @nodoc

class _$ThemeModeEntityImpl extends _ThemeModeEntity {
  const _$ThemeModeEntityImpl({this.mode = Brightness.light}) : super._();

  @override
  @JsonKey()
  final Brightness mode;

  @override
  String toString() {
    return 'ThemeModeEntity(mode: $mode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeModeEntityImpl &&
            (identical(other.mode, mode) || other.mode == mode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeModeEntityImplCopyWith<_$ThemeModeEntityImpl> get copyWith =>
      __$$ThemeModeEntityImplCopyWithImpl<_$ThemeModeEntityImpl>(
          this, _$identity);
}

abstract class _ThemeModeEntity extends ThemeModeEntity {
  const factory _ThemeModeEntity({final Brightness mode}) =
      _$ThemeModeEntityImpl;
  const _ThemeModeEntity._() : super._();

  @override
  Brightness get mode;
  @override
  @JsonKey(ignore: true)
  _$$ThemeModeEntityImplCopyWith<_$ThemeModeEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
