import 'package:chat_app/features/chats/domain/entities/chat_participant_entity/chat_participant_entity.dart';
import 'package:chat_app/features/chats/domain/entities/message_entity/message_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_entity.freezed.dart';

/// Enum representing the types of chats.
enum ChatType {
  /// Does not appear in public search
  private,

  /// Is open for every user
  group,

  /// Is open for all users, but read-only
  channel,
}

@freezed
class ChatEntity with _$ChatEntity {
  const factory ChatEntity({
    @Default(-1) int id,
    @Default('') String title,
    @Default(ChatType.group) ChatType type,
    @Default(null) String? description,
    @Default(null) DateTime? createdAt,
    @Default([]) List<ChatParticipantEntity> participants,
    @Default([]) List<MessageEntity> messages,
    @Default('') String text,
    @Default(false) bool sendingMessage,
  }) = _ChatEntity;

  const ChatEntity._();
}
