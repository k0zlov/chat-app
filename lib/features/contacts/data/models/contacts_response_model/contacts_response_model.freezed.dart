// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contacts_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ContactsResponseModel _$ContactsResponseModelFromJson(
    Map<String, dynamic> json) {
  return _ContactsResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ContactsResponseModel {
  @JsonKey(name: 'items')
  List<ContactModel> get contacts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContactsResponseModelCopyWith<ContactsResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactsResponseModelCopyWith<$Res> {
  factory $ContactsResponseModelCopyWith(ContactsResponseModel value,
          $Res Function(ContactsResponseModel) then) =
      _$ContactsResponseModelCopyWithImpl<$Res, ContactsResponseModel>;
  @useResult
  $Res call({@JsonKey(name: 'items') List<ContactModel> contacts});
}

/// @nodoc
class _$ContactsResponseModelCopyWithImpl<$Res,
        $Val extends ContactsResponseModel>
    implements $ContactsResponseModelCopyWith<$Res> {
  _$ContactsResponseModelCopyWithImpl(this._value, this._then);

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
abstract class _$$ContactsResponseModelImplCopyWith<$Res>
    implements $ContactsResponseModelCopyWith<$Res> {
  factory _$$ContactsResponseModelImplCopyWith(
          _$ContactsResponseModelImpl value,
          $Res Function(_$ContactsResponseModelImpl) then) =
      __$$ContactsResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'items') List<ContactModel> contacts});
}

/// @nodoc
class __$$ContactsResponseModelImplCopyWithImpl<$Res>
    extends _$ContactsResponseModelCopyWithImpl<$Res,
        _$ContactsResponseModelImpl>
    implements _$$ContactsResponseModelImplCopyWith<$Res> {
  __$$ContactsResponseModelImplCopyWithImpl(_$ContactsResponseModelImpl _value,
      $Res Function(_$ContactsResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contacts = null,
  }) {
    return _then(_$ContactsResponseModelImpl(
      contacts: null == contacts
          ? _value._contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<ContactModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContactsResponseModelImpl extends _ContactsResponseModel {
  const _$ContactsResponseModelImpl(
      {@JsonKey(name: 'items') final List<ContactModel> contacts = const []})
      : _contacts = contacts,
        super._();

  factory _$ContactsResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactsResponseModelImplFromJson(json);

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
    return 'ContactsResponseModel(contacts: $contacts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactsResponseModelImpl &&
            const DeepCollectionEquality().equals(other._contacts, _contacts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_contacts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactsResponseModelImplCopyWith<_$ContactsResponseModelImpl>
      get copyWith => __$$ContactsResponseModelImplCopyWithImpl<
          _$ContactsResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactsResponseModelImplToJson(
      this,
    );
  }
}

abstract class _ContactsResponseModel extends ContactsResponseModel {
  const factory _ContactsResponseModel(
          {@JsonKey(name: 'items') final List<ContactModel> contacts}) =
      _$ContactsResponseModelImpl;
  const _ContactsResponseModel._() : super._();

  factory _ContactsResponseModel.fromJson(Map<String, dynamic> json) =
      _$ContactsResponseModelImpl.fromJson;

  @override
  @JsonKey(name: 'items')
  List<ContactModel> get contacts;
  @override
  @JsonKey(ignore: true)
  _$$ContactsResponseModelImplCopyWith<_$ContactsResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
