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

ContactResponse _$ContactResponseFromJson(Map<String, dynamic> json) {
  return _ContactResponse.fromJson(json);
}

/// @nodoc
mixin _$ContactResponse {
  @JsonKey(name: 'items')
  List<ContactModel> get contacts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContactResponseCopyWith<ContactResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactResponseCopyWith<$Res> {
  factory $ContactResponseCopyWith(
          ContactResponse value, $Res Function(ContactResponse) then) =
      _$ContactResponseCopyWithImpl<$Res, ContactResponse>;
  @useResult
  $Res call({@JsonKey(name: 'items') List<ContactModel> contacts});
}

/// @nodoc
class _$ContactResponseCopyWithImpl<$Res, $Val extends ContactResponse>
    implements $ContactResponseCopyWith<$Res> {
  _$ContactResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contacts = null,
  }) {
    return _then(_value.copyWith(
      contacts: null == contacts
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<ContactModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContactResponseImplCopyWith<$Res>
    implements $ContactResponseCopyWith<$Res> {
  factory _$$ContactResponseImplCopyWith(_$ContactResponseImpl value,
          $Res Function(_$ContactResponseImpl) then) =
      __$$ContactResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'items') List<ContactModel> contacts});
}

/// @nodoc
class __$$ContactResponseImplCopyWithImpl<$Res>
    extends _$ContactResponseCopyWithImpl<$Res, _$ContactResponseImpl>
    implements _$$ContactResponseImplCopyWith<$Res> {
  __$$ContactResponseImplCopyWithImpl(
      _$ContactResponseImpl _value, $Res Function(_$ContactResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contacts = null,
  }) {
    return _then(_$ContactResponseImpl(
      contacts: null == contacts
          ? _value._contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<ContactModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContactResponseImpl extends _ContactResponse {
  const _$ContactResponseImpl(
      {@JsonKey(name: 'items') final List<ContactModel> contacts = const []})
      : _contacts = contacts,
        super._();

  factory _$ContactResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactResponseImplFromJson(json);

  final List<ContactModel> _contacts;
  @override
  @JsonKey(name: 'items')
  List<ContactModel> get contacts {
    if (_contacts is EqualUnmodifiableListView) return _contacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contacts);
  }

  @override
  String toString() {
    return 'ContactResponse(contacts: $contacts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactResponseImpl &&
            const DeepCollectionEquality().equals(other._contacts, _contacts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_contacts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactResponseImplCopyWith<_$ContactResponseImpl> get copyWith =>
      __$$ContactResponseImplCopyWithImpl<_$ContactResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactResponseImplToJson(
      this,
    );
  }
}

abstract class _ContactResponse extends ContactResponse {
  const factory _ContactResponse(
          {@JsonKey(name: 'items') final List<ContactModel> contacts}) =
      _$ContactResponseImpl;
  const _ContactResponse._() : super._();

  factory _ContactResponse.fromJson(Map<String, dynamic> json) =
      _$ContactResponseImpl.fromJson;

  @override
  @JsonKey(name: 'items')
  List<ContactModel> get contacts;
  @override
  @JsonKey(ignore: true)
  _$$ContactResponseImplCopyWith<_$ContactResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ContactModel _$ContactModelFromJson(Map<String, dynamic> json) {
  return _ContactModel.fromJson(json);
}

/// @nodoc
mixin _$ContactModel {
  int get userid => throw _privateConstructorUsedError;
  @JsonKey(name: 'addedat')
  String get addedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'contactuserid')
  int get contactUserid => throw _privateConstructorUsedError;

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
      {int userid,
      @JsonKey(name: 'addedat') String addedAt,
      @JsonKey(name: 'contactuserid') int contactUserid});
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
    Object? userid = null,
    Object? addedAt = null,
    Object? contactUserid = null,
  }) {
    return _then(_value.copyWith(
      userid: null == userid
          ? _value.userid
          : userid // ignore: cast_nullable_to_non_nullable
              as int,
      addedAt: null == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as String,
      contactUserid: null == contactUserid
          ? _value.contactUserid
          : contactUserid // ignore: cast_nullable_to_non_nullable
              as int,
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
      {int userid,
      @JsonKey(name: 'addedat') String addedAt,
      @JsonKey(name: 'contactuserid') int contactUserid});
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
    Object? userid = null,
    Object? addedAt = null,
    Object? contactUserid = null,
  }) {
    return _then(_$ContactModelImpl(
      userid: null == userid
          ? _value.userid
          : userid // ignore: cast_nullable_to_non_nullable
              as int,
      addedAt: null == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as String,
      contactUserid: null == contactUserid
          ? _value.contactUserid
          : contactUserid // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContactModelImpl extends _ContactModel {
  const _$ContactModelImpl(
      {this.userid = 0,
      @JsonKey(name: 'addedat') this.addedAt = '',
      @JsonKey(name: 'contactuserid') this.contactUserid = 0})
      : super._();

  factory _$ContactModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactModelImplFromJson(json);

  @override
  @JsonKey()
  final int userid;
  @override
  @JsonKey(name: 'addedat')
  final String addedAt;
  @override
  @JsonKey(name: 'contactuserid')
  final int contactUserid;

  @override
  String toString() {
    return 'ContactModel(userid: $userid, addedAt: $addedAt, contactUserid: $contactUserid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactModelImpl &&
            (identical(other.userid, userid) || other.userid == userid) &&
            (identical(other.addedAt, addedAt) || other.addedAt == addedAt) &&
            (identical(other.contactUserid, contactUserid) ||
                other.contactUserid == contactUserid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userid, addedAt, contactUserid);

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
          {final int userid,
          @JsonKey(name: 'addedat') final String addedAt,
          @JsonKey(name: 'contactuserid') final int contactUserid}) =
      _$ContactModelImpl;
  const _ContactModel._() : super._();

  factory _ContactModel.fromJson(Map<String, dynamic> json) =
      _$ContactModelImpl.fromJson;

  @override
  int get userid;
  @override
  @JsonKey(name: 'addedat')
  String get addedAt;
  @override
  @JsonKey(name: 'contactuserid')
  int get contactUserid;
  @override
  @JsonKey(ignore: true)
  _$$ContactModelImplCopyWith<_$ContactModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
