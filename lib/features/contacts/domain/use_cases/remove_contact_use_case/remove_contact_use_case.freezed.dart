// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remove_contact_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RemoveContactParams _$RemoveContactParamsFromJson(Map<String, dynamic> json) {
  return _RemoveContactParams.fromJson(json);
}

/// @nodoc
mixin _$RemoveContactParams {
  String get contactUserEmail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RemoveContactParamsCopyWith<RemoveContactParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoveContactParamsCopyWith<$Res> {
  factory $RemoveContactParamsCopyWith(
          RemoveContactParams value, $Res Function(RemoveContactParams) then) =
      _$RemoveContactParamsCopyWithImpl<$Res, RemoveContactParams>;
  @useResult
  $Res call({String contactUserEmail});
}

/// @nodoc
class _$RemoveContactParamsCopyWithImpl<$Res, $Val extends RemoveContactParams>
    implements $RemoveContactParamsCopyWith<$Res> {
  _$RemoveContactParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contactUserEmail = null,
  }) {
    return _then(_value.copyWith(
      contactUserEmail: null == contactUserEmail
          ? _value.contactUserEmail
          : contactUserEmail // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RemoveContactParamsImplCopyWith<$Res>
    implements $RemoveContactParamsCopyWith<$Res> {
  factory _$$RemoveContactParamsImplCopyWith(_$RemoveContactParamsImpl value,
          $Res Function(_$RemoveContactParamsImpl) then) =
      __$$RemoveContactParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String contactUserEmail});
}

/// @nodoc
class __$$RemoveContactParamsImplCopyWithImpl<$Res>
    extends _$RemoveContactParamsCopyWithImpl<$Res, _$RemoveContactParamsImpl>
    implements _$$RemoveContactParamsImplCopyWith<$Res> {
  __$$RemoveContactParamsImplCopyWithImpl(_$RemoveContactParamsImpl _value,
      $Res Function(_$RemoveContactParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contactUserEmail = null,
  }) {
    return _then(_$RemoveContactParamsImpl(
      contactUserEmail: null == contactUserEmail
          ? _value.contactUserEmail
          : contactUserEmail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RemoveContactParamsImpl extends _RemoveContactParams {
  const _$RemoveContactParamsImpl({this.contactUserEmail = ''}) : super._();

  factory _$RemoveContactParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RemoveContactParamsImplFromJson(json);

  @override
  @JsonKey()
  final String contactUserEmail;

  @override
  String toString() {
    return 'RemoveContactParams(contactUserEmail: $contactUserEmail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveContactParamsImpl &&
            (identical(other.contactUserEmail, contactUserEmail) ||
                other.contactUserEmail == contactUserEmail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, contactUserEmail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveContactParamsImplCopyWith<_$RemoveContactParamsImpl> get copyWith =>
      __$$RemoveContactParamsImplCopyWithImpl<_$RemoveContactParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RemoveContactParamsImplToJson(
      this,
    );
  }
}

abstract class _RemoveContactParams extends RemoveContactParams {
  const factory _RemoveContactParams({final String contactUserEmail}) =
      _$RemoveContactParamsImpl;
  const _RemoveContactParams._() : super._();

  factory _RemoveContactParams.fromJson(Map<String, dynamic> json) =
      _$RemoveContactParamsImpl.fromJson;

  @override
  String get contactUserEmail;
  @override
  @JsonKey(ignore: true)
  _$$RemoveContactParamsImplCopyWith<_$RemoveContactParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
