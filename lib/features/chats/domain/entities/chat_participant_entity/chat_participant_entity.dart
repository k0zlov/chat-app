import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_participant_entity.freezed.dart';

/// Enum representing the roles a chat participant can have.
enum ChatParticipantRole {
  /// Owner of the chat
  owner,

  /// Admin of the chat
  admin,

  /// Simple member
  member,

  /// Can only read messages in chat
  readonly,
}

@freezed
class ChatParticipantEntity with _$ChatParticipantEntity {
  const factory ChatParticipantEntity({
    @Default(-1) int chatId,
    @Default(-1) int userId,
    @Default('') String name,
    @Default(ChatParticipantRole.member) ChatParticipantRole role,
    @Default(null) DateTime? joinedAt,
  }) = _ChatParticipantEntity;

  const ChatParticipantEntity._();
}
