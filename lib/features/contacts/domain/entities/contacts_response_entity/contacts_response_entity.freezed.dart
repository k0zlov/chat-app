// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contacts_response_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ContactsResponseEntity {
  List<ContactEntity> get contacts => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContactsResponseEntityCopyWith<ContactsResponseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactsResponseEntityCopyWith<$Res> {
  factory $ContactsResponseEntityCopyWith(ContactsResponseEntity value,
          $Res Function(ContactsResponseEntity) then) =
      _$ContactsResponseEntityCopyWithImpl<$Res, ContactsResponseEntity>;
  @useResult
  $Res call({List<ContactEntity> contacts});
}

/// @nodoc
class _$ContactsResponseEntityCopyWithImpl<$Res,
        $Val extends ContactsResponseEntity>
    implements $ContactsResponseEntityCopyWith<$Res> {
  _$ContactsResponseEntityCopyWithImpl(this._value, this._then);

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
              as List<ContactEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContactsResponseEntityImplCopyWith<$Res>
    implements $ContactsResponseEntityCopyWith<$Res> {
  factory _$$ContactsResponseEntityImplCopyWith(
          _$ContactsResponseEntityImpl value,
          $Res Function(_$ContactsResponseEntityImpl) then) =
      __$$ContactsResponseEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ContactEntity> contacts});
}

/// @nodoc
class __$$ContactsResponseEntityImplCopyWithImpl<$Res>
    extends _$ContactsResponseEntityCopyWithImpl<$Res,
        _$ContactsResponseEntityImpl>
    implements _$$ContactsResponseEntityImplCopyWith<$Res> {
  __$$ContactsResponseEntityImplCopyWithImpl(
      _$ContactsResponseEntityImpl _value,
      $Res Function(_$ContactsResponseEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contacts = null,
  }) {
    return _then(_$ContactsResponseEntityImpl(
      contacts: null == contacts
          ? _value._contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<ContactEntity>,
    ));
  }
}

/// @nodoc

class _$ContactsResponseEntityImpl extends _ContactsResponseEntity {
  const _$ContactsResponseEntityImpl(
      {final List<ContactEntity> contacts = const []})
      : _contacts = contacts,
        super._();

  final List<ContactEntity> _contacts;
  @override
  @JsonKey()
  List<ContactEntity> get contacts {
    if (_contacts is EqualUnmodifiableListView) return _contacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contacts);
  }

  @override
  String toString() {
    return 'ContactsResponseEntity(contacts: $contacts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactsResponseEntityImpl &&
            const DeepCollectionEquality().equals(other._contacts, _contacts));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_contacts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactsResponseEntityImplCopyWith<_$ContactsResponseEntityImpl>
      get copyWith => __$$ContactsResponseEntityImplCopyWithImpl<
          _$ContactsResponseEntityImpl>(this, _$identity);
}

abstract class _ContactsResponseEntity extends ContactsResponseEntity {
  const factory _ContactsResponseEntity({final List<ContactEntity> contacts}) =
      _$ContactsResponseEntityImpl;
  const _ContactsResponseEntity._() : super._();

  @override
  List<ContactEntity> get contacts;
  @override
  @JsonKey(ignore: true)
  _$$ContactsResponseEntityImplCopyWith<_$ContactsResponseEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
