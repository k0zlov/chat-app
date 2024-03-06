// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TokenEntity {
  String get token => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TokenEntityCopyWith<TokenEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenEntityCopyWith<$Res> {
  factory $TokenEntityCopyWith(
          TokenEntity value, $Res Function(TokenEntity) then) =
      _$TokenEntityCopyWithImpl<$Res, TokenEntity>;
  @useResult
  $Res call({String token});
}

/// @nodoc
class _$TokenEntityCopyWithImpl<$Res, $Val extends TokenEntity>
    implements $TokenEntityCopyWith<$Res> {
  _$TokenEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokenEntityImplCopyWith<$Res>
    implements $TokenEntityCopyWith<$Res> {
  factory _$$TokenEntityImplCopyWith(
          _$TokenEntityImpl value, $Res Function(_$TokenEntityImpl) then) =
      __$$TokenEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token});
}

/// @nodoc
class __$$TokenEntityImplCopyWithImpl<$Res>
    extends _$TokenEntityCopyWithImpl<$Res, _$TokenEntityImpl>
    implements _$$TokenEntityImplCopyWith<$Res> {
  __$$TokenEntityImplCopyWithImpl(
      _$TokenEntityImpl _value, $Res Function(_$TokenEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_$TokenEntityImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TokenEntityImpl extends _TokenEntity {
  const _$TokenEntityImpl({this.token = ''}) : super._();

  @override
  @JsonKey()
  final String token;

  @override
  String toString() {
    return 'TokenEntity(token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenEntityImpl &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenEntityImplCopyWith<_$TokenEntityImpl> get copyWith =>
      __$$TokenEntityImplCopyWithImpl<_$TokenEntityImpl>(this, _$identity);
}

abstract class _TokenEntity extends TokenEntity {
  const factory _TokenEntity({final String token}) = _$TokenEntityImpl;
  const _TokenEntity._() : super._();

  @override
  String get token;
  @override
  @JsonKey(ignore: true)
  _$$TokenEntityImplCopyWith<_$TokenEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
