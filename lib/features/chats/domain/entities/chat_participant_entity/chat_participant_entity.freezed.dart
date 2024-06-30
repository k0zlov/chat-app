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
  int get chatId => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get bio => throw _privateConstructorUsedError;
  ChatParticipantRole get role => throw _privateConstructorUsedError;
  DateTime? get lastActivityAt => throw _privateConstructorUsedError;
  DateTime? get joinedAt => throw _privateConstructorUsedError;

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
  $Res call(
      {int chatId,
      int userId,
      String name,
      String bio,
      ChatParticipantRole role,
      DateTime? lastActivityAt,
      DateTime? joinedAt});
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
    Object? chatId = null,
    Object? userId = null,
    Object? name = null,
    Object? bio = null,
    Object? role = null,
    Object? lastActivityAt = freezed,
    Object? joinedAt = freezed,
  }) {
    return _then(_value.copyWith(
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as ChatParticipantRole,
      lastActivityAt: freezed == lastActivityAt
          ? _value.lastActivityAt
          : lastActivityAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      joinedAt: freezed == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
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
  $Res call(
      {int chatId,
      int userId,
      String name,
      String bio,
      ChatParticipantRole role,
      DateTime? lastActivityAt,
      DateTime? joinedAt});
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
    Object? chatId = null,
    Object? userId = null,
    Object? name = null,
    Object? bio = null,
    Object? role = null,
    Object? lastActivityAt = freezed,
    Object? joinedAt = freezed,
  }) {
    return _then(_$ChatParticipantEntityImpl(
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as ChatParticipantRole,
      lastActivityAt: freezed == lastActivityAt
          ? _value.lastActivityAt
          : lastActivityAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      joinedAt: freezed == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$ChatParticipantEntityImpl extends _ChatParticipantEntity {
  const _$ChatParticipantEntityImpl(
      {this.chatId = -1,
      this.userId = -1,
      this.name = '',
      this.bio = '',
      this.role = ChatParticipantRole.member,
      this.lastActivityAt = null,
      this.joinedAt = null})
      : super._();

  @override
  @JsonKey()
  final int chatId;
  @override
  @JsonKey()
  final int userId;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String bio;
  @override
  @JsonKey()
  final ChatParticipantRole role;
  @override
  @JsonKey()
  final DateTime? lastActivityAt;
  @override
  @JsonKey()
  final DateTime? joinedAt;

  @override
  String toString() {
    return 'ChatParticipantEntity(chatId: $chatId, userId: $userId, name: $name, bio: $bio, role: $role, lastActivityAt: $lastActivityAt, joinedAt: $joinedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatParticipantEntityImpl &&
            (identical(other.chatId, chatId) || other.chatId == chatId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.lastActivityAt, lastActivityAt) ||
                other.lastActivityAt == lastActivityAt) &&
            (identical(other.joinedAt, joinedAt) ||
                other.joinedAt == joinedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, chatId, userId, name, bio, role, lastActivityAt, joinedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatParticipantEntityImplCopyWith<_$ChatParticipantEntityImpl>
      get copyWith => __$$ChatParticipantEntityImplCopyWithImpl<
          _$ChatParticipantEntityImpl>(this, _$identity);
}

abstract class _ChatParticipantEntity extends ChatParticipantEntity {
  const factory _ChatParticipantEntity(
      {final int chatId,
      final int userId,
      final String name,
      final String bio,
      final ChatParticipantRole role,
      final DateTime? lastActivityAt,
      final DateTime? joinedAt}) = _$ChatParticipantEntityImpl;
  const _ChatParticipantEntity._() : super._();

  @override
  int get chatId;
  @override
  int get userId;
  @override
  String get name;
  @override
  String get bio;
  @override
  ChatParticipantRole get role;
  @override
  DateTime? get lastActivityAt;
  @override
  DateTime? get joinedAt;
  @override
  @JsonKey(ignore: true)
  _$$ChatParticipantEntityImplCopyWith<_$ChatParticipantEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
