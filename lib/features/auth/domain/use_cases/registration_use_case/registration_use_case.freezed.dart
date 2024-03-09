// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RegistrationParams _$RegistrationParamsFromJson(Map<String, dynamic> json) {
  return _RegistrationParams.fromJson(json);
}

/// @nodoc
mixin _$RegistrationParams {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegistrationParamsCopyWith<RegistrationParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationParamsCopyWith<$Res> {
  factory $RegistrationParamsCopyWith(
          RegistrationParams value, $Res Function(RegistrationParams) then) =
      _$RegistrationParamsCopyWithImpl<$Res, RegistrationParams>;
  @useResult
  $Res call({String name, String email, String password});
}

/// @nodoc
class _$RegistrationParamsCopyWithImpl<$Res, $Val extends RegistrationParams>
    implements $RegistrationParamsCopyWith<$Res> {
  _$RegistrationParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegistrationParamsImplCopyWith<$Res>
    implements $RegistrationParamsCopyWith<$Res> {
  factory _$$RegistrationParamsImplCopyWith(_$RegistrationParamsImpl value,
          $Res Function(_$RegistrationParamsImpl) then) =
      __$$RegistrationParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String email, String password});
}

/// @nodoc
class __$$RegistrationParamsImplCopyWithImpl<$Res>
    extends _$RegistrationParamsCopyWithImpl<$Res, _$RegistrationParamsImpl>
    implements _$$RegistrationParamsImplCopyWith<$Res> {
  __$$RegistrationParamsImplCopyWithImpl(_$RegistrationParamsImpl _value,
      $Res Function(_$RegistrationParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$RegistrationParamsImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegistrationParamsImpl extends _RegistrationParams {
  const _$RegistrationParamsImpl(
      {this.name = '', this.email = '', this.password = ''})
      : super._();

  factory _$RegistrationParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegistrationParamsImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String password;

  @override
  String toString() {
    return 'RegistrationParams(name: $name, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationParamsImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrationParamsImplCopyWith<_$RegistrationParamsImpl> get copyWith =>
      __$$RegistrationParamsImplCopyWithImpl<_$RegistrationParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegistrationParamsImplToJson(
      this,
    );
  }
}

abstract class _RegistrationParams extends RegistrationParams {
  const factory _RegistrationParams(
      {final String name,
      final String email,
      final String password}) = _$RegistrationParamsImpl;
  const _RegistrationParams._() : super._();

  factory _RegistrationParams.fromJson(Map<String, dynamic> json) =
      _$RegistrationParamsImpl.fromJson;

  @override
  String get name;
  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$RegistrationParamsImplCopyWith<_$RegistrationParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
