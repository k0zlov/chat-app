// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_participant_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatParticipantEntity {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatParticipantEntityCopyWith<ChatParticipantEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatParticipantEntityCopyWith<$Res> {
  factory $ChatParticipantEntityCopyWith(ChatParticipantEntity value,
          $Res Function(ChatParticipantEntity) then) =
      _$ChatParticipantEntityCopyWithImpl<$Res, ChatParticipantEntity>;
  @useResult
  $Res call({int id, int userId, String title, DateTime? createdAt});
}

/// @nodoc
class _$ChatParticipantEntityCopyWithImpl<$Res,
        $Val extends ChatParticipantEntity>
    implements $ChatParticipantEntityCopyWith<$Res> {
  _$ChatParticipantEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatParticipantEntityImplCopyWith<$Res>
    implements $ChatParticipantEntityCopyWith<$Res> {
  factory _$$ChatParticipantEntityImplCopyWith(
          _$ChatParticipantEntityImpl value,
          $Res Function(_$ChatParticipantEntityImpl) then) =
      __$$ChatParticipantEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int userId, String title, DateTime? createdAt});
}

/// @nodoc
class __$$ChatParticipantEntityImplCopyWithImpl<$Res>
    extends _$ChatParticipantEntityCopyWithImpl<$Res,
        _$ChatParticipantEntityImpl>
    implements _$$ChatParticipantEntityImplCopyWith<$Res> {
  __$$ChatParticipantEntityImplCopyWithImpl(_$ChatParticipantEntityImpl _value,
      $Res Function(_$ChatParticipantEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$ChatParticipantEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$ChatParticipantEntityImpl extends _ChatParticipantEntity {
  const _$ChatParticipantEntityImpl(
      {this.id = -1, this.userId = -1, this.title = '', this.createdAt = null})
      : super._();

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final int userId;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'ChatParticipantEntity(id: $id, userId: $userId, title: $title, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatParticipantEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, userId, title, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatParticipantEntityImplCopyWith<_$ChatParticipantEntityImpl>
      get copyWith => __$$ChatParticipantEntityImplCopyWithImpl<
          _$ChatParticipantEntityImpl>(this, _$identity);
}

abstract class _ChatParticipantEntity extends ChatParticipantEntity {
  const factory _ChatParticipantEntity(
      {final int id,
      final int userId,
      final String title,
      final DateTime? createdAt}) = _$ChatParticipantEntityImpl;
  const _ChatParticipantEntity._() : super._();

  @override
  int get id;
  @override
  int get userId;
  @override
  String get title;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$ChatParticipantEntityImplCopyWith<_$ChatParticipantEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
