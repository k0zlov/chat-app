// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_contact_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddContactParams _$AddContactParamsFromJson(Map<String, dynamic> json) {
  return _AddContactParams.fromJson(json);
}

/// @nodoc
mixin _$AddContactParams {
  String get contactUserEmail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddContactParamsCopyWith<AddContactParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddContactParamsCopyWith<$Res> {
  factory $AddContactParamsCopyWith(
          AddContactParams value, $Res Function(AddContactParams) then) =
      _$AddContactParamsCopyWithImpl<$Res, AddContactParams>;
  @useResult
  $Res call({String contactUserEmail});
}

/// @nodoc
class _$AddContactParamsCopyWithImpl<$Res, $Val extends AddContactParams>
    implements $AddContactParamsCopyWith<$Res> {
  _$AddContactParamsCopyWithImpl(this._value, this._then);

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
abstract class _$$AddContactParamsImplCopyWith<$Res>
    implements $AddContactParamsCopyWith<$Res> {
  factory _$$AddContactParamsImplCopyWith(_$AddContactParamsImpl value,
          $Res Function(_$AddContactParamsImpl) then) =
      __$$AddContactParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String contactUserEmail});
}

/// @nodoc
class __$$AddContactParamsImplCopyWithImpl<$Res>
    extends _$AddContactParamsCopyWithImpl<$Res, _$AddContactParamsImpl>
    implements _$$AddContactParamsImplCopyWith<$Res> {
  __$$AddContactParamsImplCopyWithImpl(_$AddContactParamsImpl _value,
      $Res Function(_$AddContactParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contactUserEmail = null,
  }) {
    return _then(_$AddContactParamsImpl(
      contactUserEmail: null == contactUserEmail
          ? _value.contactUserEmail
          : contactUserEmail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddContactParamsImpl extends _AddContactParams {
  const _$AddContactParamsImpl({this.contactUserEmail = ''}) : super._();

  factory _$AddContactParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddContactParamsImplFromJson(json);

  @override
  @JsonKey()
  final String contactUserEmail;

  @override
  String toString() {
    return 'AddContactParams(contactUserEmail: $contactUserEmail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddContactParamsImpl &&
            (identical(other.contactUserEmail, contactUserEmail) ||
                other.contactUserEmail == contactUserEmail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, contactUserEmail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddContactParamsImplCopyWith<_$AddContactParamsImpl> get copyWith =>
      __$$AddContactParamsImplCopyWithImpl<_$AddContactParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddContactParamsImplToJson(
      this,
    );
  }
}

abstract class _AddContactParams extends AddContactParams {
  const factory _AddContactParams({final String contactUserEmail}) =
      _$AddContactParamsImpl;
  const _AddContactParams._() : super._();

  factory _AddContactParams.fromJson(Map<String, dynamic> json) =
      _$AddContactParamsImpl.fromJson;

  @override
  String get contactUserEmail;
  @override
  @JsonKey(ignore: true)
  _$$AddContactParamsImplCopyWith<_$AddContactParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
