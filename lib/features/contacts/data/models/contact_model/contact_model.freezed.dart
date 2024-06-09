// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ContactModel _$ContactModelFromJson(Map<String, dynamic> json) {
  return _ContactModel.fromJson(json);
}

/// @nodoc
mixin _$ContactModel {
  int get contactUserId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get addedAt => throw _privateConstructorUsedError;
  String get lastActivityAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContactModelCopyWith<ContactModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactModelCopyWith<$Res> {
  factory $ContactModelCopyWith(
          ContactModel value, $Res Function(ContactModel) then) =
      _$ContactModelCopyWithImpl<$Res, ContactModel>;
  @useResult
  $Res call(
      {int contactUserId,
      String name,
      String email,
      String addedAt,
      String lastActivityAt});
}

/// @nodoc
class _$ContactModelCopyWithImpl<$Res, $Val extends ContactModel>
    implements $ContactModelCopyWith<$Res> {
  _$ContactModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contactUserId = null,
    Object? name = null,
    Object? email = null,
    Object? addedAt = null,
    Object? lastActivityAt = null,
  }) {
    return _then(_value.copyWith(
      contactUserId: null == contactUserId
          ? _value.contactUserId
          : contactUserId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      addedAt: null == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as String,
      lastActivityAt: null == lastActivityAt
          ? _value.lastActivityAt
          : lastActivityAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContactModelImplCopyWith<$Res>
    implements $ContactModelCopyWith<$Res> {
  factory _$$ContactModelImplCopyWith(
          _$ContactModelImpl value, $Res Function(_$ContactModelImpl) then) =
      __$$ContactModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int contactUserId,
      String name,
      String email,
      String addedAt,
      String lastActivityAt});
}

/// @nodoc
class __$$ContactModelImplCopyWithImpl<$Res>
    extends _$ContactModelCopyWithImpl<$Res, _$ContactModelImpl>
    implements _$$ContactModelImplCopyWith<$Res> {
  __$$ContactModelImplCopyWithImpl(
      _$ContactModelImpl _value, $Res Function(_$ContactModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contactUserId = null,
    Object? name = null,
    Object? email = null,
    Object? addedAt = null,
    Object? lastActivityAt = null,
  }) {
    return _then(_$ContactModelImpl(
      contactUserId: null == contactUserId
          ? _value.contactUserId
          : contactUserId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      addedAt: null == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as String,
      lastActivityAt: null == lastActivityAt
          ? _value.lastActivityAt
          : lastActivityAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContactModelImpl extends _ContactModel {
  const _$ContactModelImpl(
      {this.contactUserId = -1,
      this.name = '',
      this.email = '',
      this.addedAt = '',
      this.lastActivityAt = ''})
      : super._();

  factory _$ContactModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactModelImplFromJson(json);

  @override
  @JsonKey()
  final int contactUserId;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String addedAt;
  @override
  @JsonKey()
  final String lastActivityAt;

  @override
  String toString() {
    return 'ContactModel(contactUserId: $contactUserId, name: $name, email: $email, addedAt: $addedAt, lastActivityAt: $lastActivityAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactModelImpl &&
            (identical(other.contactUserId, contactUserId) ||
                other.contactUserId == contactUserId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.addedAt, addedAt) || other.addedAt == addedAt) &&
            (identical(other.lastActivityAt, lastActivityAt) ||
                other.lastActivityAt == lastActivityAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, contactUserId, name, email, addedAt, lastActivityAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactModelImplCopyWith<_$ContactModelImpl> get copyWith =>
      __$$ContactModelImplCopyWithImpl<_$ContactModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactModelImplToJson(
      this,
    );
  }
}

abstract class _ContactModel extends ContactModel {
  const factory _ContactModel(
      {final int contactUserId,
      final String name,
      final String email,
      final String addedAt,
      final String lastActivityAt}) = _$ContactModelImpl;
  const _ContactModel._() : super._();

  factory _ContactModel.fromJson(Map<String, dynamic> json) =
      _$ContactModelImpl.fromJson;

  @override
  int get contactUserId;
  @override
  String get name;
  @override
  String get email;
  @override
  String get addedAt;
  @override
  String get lastActivityAt;
  @override
  @JsonKey(ignore: true)
  _$$ContactModelImplCopyWith<_$ContactModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
