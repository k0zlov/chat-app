// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_participant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatParticipantModel _$ChatParticipantModelFromJson(Map<String, dynamic> json) {
  return _ChatParticipantModel.fromJson(json);
}

/// @nodoc
mixin _$ChatParticipantModel {
  int get chatId => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String get bio => throw _privateConstructorUsedError;
  String get lastActivityAt => throw _privateConstructorUsedError;
  String get joinedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatParticipantModelCopyWith<ChatParticipantModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatParticipantModelCopyWith<$Res> {
  factory $ChatParticipantModelCopyWith(ChatParticipantModel value,
          $Res Function(ChatParticipantModel) then) =
      _$ChatParticipantModelCopyWithImpl<$Res, ChatParticipantModel>;
  @useResult
  $Res call(
      {int chatId,
      int userId,
      String name,
      String role,
      String bio,
      String lastActivityAt,
      String joinedAt});
}

/// @nodoc
class _$ChatParticipantModelCopyWithImpl<$Res,
        $Val extends ChatParticipantModel>
    implements $ChatParticipantModelCopyWith<$Res> {
  _$ChatParticipantModelCopyWithImpl(this._value, this._then);

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
    Object? role = null,
    Object? bio = null,
    Object? lastActivityAt = null,
    Object? joinedAt = null,
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
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      lastActivityAt: null == lastActivityAt
          ? _value.lastActivityAt
          : lastActivityAt // ignore: cast_nullable_to_non_nullable
              as String,
      joinedAt: null == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatParticipantModelImplCopyWith<$Res>
    implements $ChatParticipantModelCopyWith<$Res> {
  factory _$$ChatParticipantModelImplCopyWith(_$ChatParticipantModelImpl value,
          $Res Function(_$ChatParticipantModelImpl) then) =
      __$$ChatParticipantModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int chatId,
      int userId,
      String name,
      String role,
      String bio,
      String lastActivityAt,
      String joinedAt});
}

/// @nodoc
class __$$ChatParticipantModelImplCopyWithImpl<$Res>
    extends _$ChatParticipantModelCopyWithImpl<$Res, _$ChatParticipantModelImpl>
    implements _$$ChatParticipantModelImplCopyWith<$Res> {
  __$$ChatParticipantModelImplCopyWithImpl(_$ChatParticipantModelImpl _value,
      $Res Function(_$ChatParticipantModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
    Object? userId = null,
    Object? name = null,
    Object? role = null,
    Object? bio = null,
    Object? lastActivityAt = null,
    Object? joinedAt = null,
  }) {
    return _then(_$ChatParticipantModelImpl(
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
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      lastActivityAt: null == lastActivityAt
          ? _value.lastActivityAt
          : lastActivityAt // ignore: cast_nullable_to_non_nullable
              as String,
      joinedAt: null == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatParticipantModelImpl extends _ChatParticipantModel {
  const _$ChatParticipantModelImpl(
      {this.chatId = -1,
      this.userId = -1,
      this.name = '',
      this.role = '',
      this.bio = '',
      this.lastActivityAt = '',
      this.joinedAt = ''})
      : super._();

  factory _$ChatParticipantModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatParticipantModelImplFromJson(json);

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
  final String role;
  @override
  @JsonKey()
  final String bio;
  @override
  @JsonKey()
  final String lastActivityAt;
  @override
  @JsonKey()
  final String joinedAt;

  @override
  String toString() {
    return 'ChatParticipantModel(chatId: $chatId, userId: $userId, name: $name, role: $role, bio: $bio, lastActivityAt: $lastActivityAt, joinedAt: $joinedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatParticipantModelImpl &&
            (identical(other.chatId, chatId) || other.chatId == chatId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.lastActivityAt, lastActivityAt) ||
                other.lastActivityAt == lastActivityAt) &&
            (identical(other.joinedAt, joinedAt) ||
                other.joinedAt == joinedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, chatId, userId, name, role, bio, lastActivityAt, joinedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatParticipantModelImplCopyWith<_$ChatParticipantModelImpl>
      get copyWith =>
          __$$ChatParticipantModelImplCopyWithImpl<_$ChatParticipantModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatParticipantModelImplToJson(
      this,
    );
  }
}

abstract class _ChatParticipantModel extends ChatParticipantModel {
  const factory _ChatParticipantModel(
      {final int chatId,
      final int userId,
      final String name,
      final String role,
      final String bio,
      final String lastActivityAt,
      final String joinedAt}) = _$ChatParticipantModelImpl;
  const _ChatParticipantModel._() : super._();

  factory _ChatParticipantModel.fromJson(Map<String, dynamic> json) =
      _$ChatParticipantModelImpl.fromJson;

  @override
  int get chatId;
  @override
  int get userId;
  @override
  String get name;
  @override
  String get role;
  @override
  String get bio;
  @override
  String get lastActivityAt;
  @override
  String get joinedAt;
  @override
  @JsonKey(ignore: true)
  _$$ChatParticipantModelImplCopyWith<_$ChatParticipantModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
