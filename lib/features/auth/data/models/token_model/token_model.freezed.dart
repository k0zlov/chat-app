// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TokenResponseModel _$TokenResponseModelFromJson(Map<String, dynamic> json) {
  return _TokenResponseModel.fromJson(json);
}

/// @nodoc
mixin _$TokenResponseModel {
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenResponseModelCopyWith<TokenResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenResponseModelCopyWith<$Res> {
  factory $TokenResponseModelCopyWith(
          TokenResponseModel value, $Res Function(TokenResponseModel) then) =
      _$TokenResponseModelCopyWithImpl<$Res, TokenResponseModel>;
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class _$TokenResponseModelCopyWithImpl<$Res, $Val extends TokenResponseModel>
    implements $TokenResponseModelCopyWith<$Res> {
  _$TokenResponseModelCopyWithImpl(this._value, this._then);

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
abstract class _$$TokenResponseModelImplCopyWith<$Res>
    implements $TokenResponseModelCopyWith<$Res> {
  factory _$$TokenResponseModelImplCopyWith(_$TokenResponseModelImpl value,
          $Res Function(_$TokenResponseModelImpl) then) =
      __$$TokenResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class __$$TokenResponseModelImplCopyWithImpl<$Res>
    extends _$TokenResponseModelCopyWithImpl<$Res, _$TokenResponseModelImpl>
    implements _$$TokenResponseModelImplCopyWith<$Res> {
  __$$TokenResponseModelImplCopyWithImpl(_$TokenResponseModelImpl _value,
      $Res Function(_$TokenResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_$TokenResponseModelImpl(
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
@JsonSerializable()
class _$TokenResponseModelImpl extends _TokenResponseModel {
  const _$TokenResponseModelImpl(
      {this.accessToken = '', this.refreshToken = ''})
      : super._();

  factory _$TokenResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenResponseModelImplFromJson(json);

  @override
  @JsonKey()
  final String accessToken;
  @override
  @JsonKey()
  final String refreshToken;

  @override
  String toString() {
    return 'TokenResponseModel(accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenResponseModelImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenResponseModelImplCopyWith<_$TokenResponseModelImpl> get copyWith =>
      __$$TokenResponseModelImplCopyWithImpl<_$TokenResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenResponseModelImplToJson(
      this,
    );
  }
}

abstract class _TokenResponseModel extends TokenResponseModel {
  const factory _TokenResponseModel(
      {final String accessToken,
      final String refreshToken}) = _$TokenResponseModelImpl;
  const _TokenResponseModel._() : super._();

  factory _TokenResponseModel.fromJson(Map<String, dynamic> json) =
      _$TokenResponseModelImpl.fromJson;

  @override
  String get accessToken;
  @override
  String get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$$TokenResponseModelImplCopyWith<_$TokenResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
