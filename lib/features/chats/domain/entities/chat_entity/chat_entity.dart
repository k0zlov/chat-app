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

  /// Special chat type for chat with saved messages of users
  savedMessages;

  bool get isPrivate => this == ChatType.private;

  bool get isSavedMessages => this == ChatType.savedMessages;

  bool get isGroup => this == ChatType.group;

  bool get isChannel => this == ChatType.channel;
}

/// The [ChatEntity] class represents a chat entity in the domain layer.
/// This class uses the `freezed` package to generate immutable value objects.
@freezed
class ChatEntity with _$ChatEntity {
  /// Creates a [ChatEntity] instance.
  ///
  /// The factory constructor provides default values for the fields.
  ///
  /// - `id`: The unique identifier of the chat, default is -1.
  /// - `title`: The title of the chat, default is an empty string.
  /// - `type`: The type of chat (e.g., private, group, channel), default is [ChatType.group].
  /// - `description`: An optional description of the chat, default is null.
  /// - `createdAt`: The creation date of the chat, default is null.
  /// - `participants`: A list of participants in the chat, default is an empty list.
  /// - `messages`: A list of messages in the chat, default is an empty list.
  /// - `isPinned`: Indicates if chat is pinned by user, default is false.
  /// - `messages`: Indicates if chat is archived by user, default is false.
  /// - `text`: The current text being input by the user, default is an empty string.
  /// - `editTitleText`: The text being input by the user in edit title, default is an empty string.
  /// - `editDescriptionText`: The text being input by the user in edit description, default is an empty string.
  /// - `sendingMessage`: A flag indicating if a message is being sent, default is false.
  const factory ChatEntity({
    @Default(-1) int id,
    @Default('') String title,
    @Default(ChatType.group) ChatType type,
    @Default(null) String? description,
    @Default(null) DateTime? createdAt,
    @Default([]) List<ChatParticipantEntity> participants,
    @Default([]) List<MessageEntity> messages,
    @Default(false) bool isPinned,
    @Default(false) bool isArchived,
    @Default('') String text,
    @Default('') String editTitleText,
    @Default('') String editDescriptionText,
    @Default(false) bool sendingMessage,
  }) = _ChatEntity;

  /// Private constructor for [ChatEntity].
  /// This is used by the `freezed` package to generate the implementation.
  const ChatEntity._();
}
