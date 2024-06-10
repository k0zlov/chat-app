// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatEntity {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  ChatType get type => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  List<ChatParticipantEntity> get participants =>
      throw _privateConstructorUsedError;
  List<MessageEntity> get messages => throw _privateConstructorUsedError;
  bool get isPinned => throw _privateConstructorUsedError;
  bool get isArchived => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  bool get sendingMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatEntityCopyWith<ChatEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatEntityCopyWith<$Res> {
  factory $ChatEntityCopyWith(
          ChatEntity value, $Res Function(ChatEntity) then) =
      _$ChatEntityCopyWithImpl<$Res, ChatEntity>;
  @useResult
  $Res call(
      {int id,
      String title,
      ChatType type,
      String? description,
      DateTime? createdAt,
      List<ChatParticipantEntity> participants,
      List<MessageEntity> messages,
      bool isPinned,
      bool isArchived,
      String text,
      bool sendingMessage});
}

/// @nodoc
class _$ChatEntityCopyWithImpl<$Res, $Val extends ChatEntity>
    implements $ChatEntityCopyWith<$Res> {
  _$ChatEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? participants = null,
    Object? messages = null,
    Object? isPinned = null,
    Object? isArchived = null,
    Object? text = null,
    Object? sendingMessage = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChatType,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      participants: null == participants
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<ChatParticipantEntity>,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<MessageEntity>,
      isPinned: null == isPinned
          ? _value.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool,
      isArchived: null == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      sendingMessage: null == sendingMessage
          ? _value.sendingMessage
          : sendingMessage // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatEntityImplCopyWith<$Res>
    implements $ChatEntityCopyWith<$Res> {
  factory _$$ChatEntityImplCopyWith(
          _$ChatEntityImpl value, $Res Function(_$ChatEntityImpl) then) =
      __$$ChatEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      ChatType type,
      String? description,
      DateTime? createdAt,
      List<ChatParticipantEntity> participants,
      List<MessageEntity> messages,
      bool isPinned,
      bool isArchived,
      String text,
      bool sendingMessage});
}

/// @nodoc
class __$$ChatEntityImplCopyWithImpl<$Res>
    extends _$ChatEntityCopyWithImpl<$Res, _$ChatEntityImpl>
    implements _$$ChatEntityImplCopyWith<$Res> {
  __$$ChatEntityImplCopyWithImpl(
      _$ChatEntityImpl _value, $Res Function(_$ChatEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? participants = null,
    Object? messages = null,
    Object? isPinned = null,
    Object? isArchived = null,
    Object? text = null,
    Object? sendingMessage = null,
  }) {
    return _then(_$ChatEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChatType,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      participants: null == participants
          ? _value._participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<ChatParticipantEntity>,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<MessageEntity>,
      isPinned: null == isPinned
          ? _value.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool,
      isArchived: null == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      sendingMessage: null == sendingMessage
          ? _value.sendingMessage
          : sendingMessage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ChatEntityImpl extends _ChatEntity {
  const _$ChatEntityImpl(
      {this.id = -1,
      this.title = '',
      this.type = ChatType.group,
      this.description = null,
      this.createdAt = null,
      final List<ChatParticipantEntity> participants = const [],
      final List<MessageEntity> messages = const [],
      this.isPinned = false,
      this.isArchived = false,
      this.text = '',
      this.sendingMessage = false})
      : _participants = participants,
        _messages = messages,
        super._();

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final ChatType type;
  @override
  @JsonKey()
  final String? description;
  @override
  @JsonKey()
  final DateTime? createdAt;
  final List<ChatParticipantEntity> _participants;
  @override
  @JsonKey()
  List<ChatParticipantEntity> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

  final List<MessageEntity> _messages;
  @override
  @JsonKey()
  List<MessageEntity> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  @JsonKey()
  final bool isPinned;
  @override
  @JsonKey()
  final bool isArchived;
  @override
  @JsonKey()
  final String text;
  @override
  @JsonKey()
  final bool sendingMessage;

  @override
  String toString() {
    return 'ChatEntity(id: $id, title: $title, type: $type, description: $description, createdAt: $createdAt, participants: $participants, messages: $messages, isPinned: $isPinned, isArchived: $isArchived, text: $text, sendingMessage: $sendingMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality()
                .equals(other._participants, _participants) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.isPinned, isPinned) ||
                other.isPinned == isPinned) &&
            (identical(other.isArchived, isArchived) ||
                other.isArchived == isArchived) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.sendingMessage, sendingMessage) ||
                other.sendingMessage == sendingMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      type,
      description,
      createdAt,
      const DeepCollectionEquality().hash(_participants),
      const DeepCollectionEquality().hash(_messages),
      isPinned,
      isArchived,
      text,
      sendingMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatEntityImplCopyWith<_$ChatEntityImpl> get copyWith =>
      __$$ChatEntityImplCopyWithImpl<_$ChatEntityImpl>(this, _$identity);
}

abstract class _ChatEntity extends ChatEntity {
  const factory _ChatEntity(
      {final int id,
      final String title,
      final ChatType type,
      final String? description,
      final DateTime? createdAt,
      final List<ChatParticipantEntity> participants,
      final List<MessageEntity> messages,
      final bool isPinned,
      final bool isArchived,
      final String text,
      final bool sendingMessage}) = _$ChatEntityImpl;
  const _ChatEntity._() : super._();

  @override
  int get id;
  @override
  String get title;
  @override
  ChatType get type;
  @override
  String? get description;
  @override
  DateTime? get createdAt;
  @override
  List<ChatParticipantEntity> get participants;
  @override
  List<MessageEntity> get messages;
  @override
  bool get isPinned;
  @override
  bool get isArchived;
  @override
  String get text;
  @override
  bool get sendingMessage;
  @override
  @JsonKey(ignore: true)
  _$$ChatEntityImplCopyWith<_$ChatEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
