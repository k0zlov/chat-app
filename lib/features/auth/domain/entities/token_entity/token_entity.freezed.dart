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
mixin _$TokenResponseEntity {
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TokenResponseEntityCopyWith<TokenResponseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenResponseEntityCopyWith<$Res> {
  factory $TokenResponseEntityCopyWith(
          TokenResponseEntity value, $Res Function(TokenResponseEntity) then) =
      _$TokenResponseEntityCopyWithImpl<$Res, TokenResponseEntity>;
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class _$TokenResponseEntityCopyWithImpl<$Res, $Val extends TokenResponseEntity>
    implements $TokenResponseEntityCopyWith<$Res> {
  _$TokenResponseEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokenResponseEntityImplCopyWith<$Res>
    implements $TokenResponseEntityCopyWith<$Res> {
  factory _$$TokenResponseEntityImplCopyWith(_$TokenResponseEntityImpl value,
          $Res Function(_$TokenResponseEntityImpl) then) =
      __$$TokenResponseEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class __$$TokenResponseEntityImplCopyWithImpl<$Res>
    extends _$TokenResponseEntityCopyWithImpl<$Res, _$TokenResponseEntityImpl>
    implements _$$TokenResponseEntityImplCopyWith<$Res> {
  __$$TokenResponseEntityImplCopyWithImpl(_$TokenResponseEntityImpl _value,
      $Res Function(_$TokenResponseEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_$TokenResponseEntityImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TokenResponseEntityImpl extends _TokenResponseEntity {
  const _$TokenResponseEntityImpl(
      {this.accessToken = '', this.refreshToken = ''})
      : super._();

  @override
  @JsonKey()
  final String accessToken;
  @override
  @JsonKey()
  final String refreshToken;

  @override
  String toString() {
    return 'TokenResponseEntity(accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenResponseEntityImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenResponseEntityImplCopyWith<_$TokenResponseEntityImpl> get copyWith =>
      __$$TokenResponseEntityImplCopyWithImpl<_$TokenResponseEntityImpl>(
          this, _$identity);
}

abstract class _TokenResponseEntity extends TokenResponseEntity {
  const factory _TokenResponseEntity(
      {final String accessToken,
      final String refreshToken}) = _$TokenResponseEntityImpl;
  const _TokenResponseEntity._() : super._();

  @override
  String get accessToken;
  @override
  String get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$$TokenResponseEntityImplCopyWith<_$TokenResponseEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
