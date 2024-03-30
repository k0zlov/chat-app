// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_mode_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ThemeModeModel {
  String get modeName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThemeModeModelCopyWith<ThemeModeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeModeModelCopyWith<$Res> {
  factory $ThemeModeModelCopyWith(
          ThemeModeModel value, $Res Function(ThemeModeModel) then) =
      _$ThemeModeModelCopyWithImpl<$Res, ThemeModeModel>;
  @useResult
  $Res call({String modeName});
}

/// @nodoc
class _$ThemeModeModelCopyWithImpl<$Res, $Val extends ThemeModeModel>
    implements $ThemeModeModelCopyWith<$Res> {
  _$ThemeModeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? modeName = null,
  }) {
    return _then(_value.copyWith(
      modeName: null == modeName
          ? _value.modeName
          : modeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThemeModeModelImplCopyWith<$Res>
    implements $ThemeModeModelCopyWith<$Res> {
  factory _$$ThemeModeModelImplCopyWith(_$ThemeModeModelImpl value,
          $Res Function(_$ThemeModeModelImpl) then) =
      __$$ThemeModeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String modeName});
}

/// @nodoc
class __$$ThemeModeModelImplCopyWithImpl<$Res>
    extends _$ThemeModeModelCopyWithImpl<$Res, _$ThemeModeModelImpl>
    implements _$$ThemeModeModelImplCopyWith<$Res> {
  __$$ThemeModeModelImplCopyWithImpl(
      _$ThemeModeModelImpl _value, $Res Function(_$ThemeModeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? modeName = null,
  }) {
    return _then(_$ThemeModeModelImpl(
      modeName: null == modeName
          ? _value.modeName
          : modeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ThemeModeModelImpl extends _ThemeModeModel {
  const _$ThemeModeModelImpl({this.modeName = ''}) : super._();

  @override
  @JsonKey()
  final String modeName;

  @override
  String toString() {
    return 'ThemeModeModel(modeName: $modeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeModeModelImpl &&
            (identical(other.modeName, modeName) ||
                other.modeName == modeName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, modeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeModeModelImplCopyWith<_$ThemeModeModelImpl> get copyWith =>
      __$$ThemeModeModelImplCopyWithImpl<_$ThemeModeModelImpl>(
          this, _$identity);
}

abstract class _ThemeModeModel extends ThemeModeModel {
  const factory _ThemeModeModel({final String modeName}) = _$ThemeModeModelImpl;
  const _ThemeModeModel._() : super._();

  @override
  String get modeName;
  @override
  @JsonKey(ignore: true)
  _$$ThemeModeModelImplCopyWith<_$ThemeModeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
