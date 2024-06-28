import 'package:chat_app/features/chats/data/models/chat_participant_model/chat_participant_model.dart';
import 'package:chat_app/features/chats/data/models/message_model/message_model.dart';
import 'package:chat_app/features/chats/domain/entities/chat_entity/chat_entity.dart';
import 'package:chat_app/utils/enum_parsing/enum_parsing_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_model.freezed.dart';

part 'chat_model.g.dart';

/// The [ChatModel] class represents the data model for a chat.
/// This class uses the `freezed` package to generate immutable
/// value objects and includes JSON serialization.
@freezed
class ChatModel with _$ChatModel {
  /// Creates a [ChatModel] instance.
  ///
  /// The factory constructor provides default values for the fields.
  ///
  /// - `id`: The unique identifier of the chat, default is -1.
  /// - `title`: The title of the chat, default is an empty string.
  /// - `type`: The type of chat (e.g., private or group), default is an empty string.
  /// - `description`: An optional description of the chat, default is null.
  /// - `createdAt`: The creation date of the chat in ISO 8601 format, default is an empty string.
  /// - `messages`: A list of messages in the chat, default is an empty list.
  /// - `isPinned`: Indicates if chat is pinned by user, default is false.
  /// - `messages`: Indicates if chat is archived by user, default is false.
  /// - `participants`: A list of participants in the chat, default is an empty list.
  const factory ChatModel({
    @Default(-1) int id,
    @Default('') String title,
    @Default('') String type,
    @Default(null) String? description,
    @Default('') String createdAt,
    @Default(false) bool isPinned,
    @Default(false) bool isArchived,
    @Default([]) List<MessageModel> messages,
    @Default([]) List<ChatParticipantModel> participants,
  }) = _ChatModel;

  /// Private constructor for [ChatModel].
  /// This is used by the `freezed` package to generate the implementation.
  const ChatModel._();

  /// Creates a [ChatModel] instance from a JSON object.
  ///
  /// This factory constructor uses the generated `_$ChatModelFromJson` function
  /// to deserialize the JSON map into a [ChatModel] instance.
  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);

  /// Converts the [ChatModel] instance to a [ChatEntity].
  ///
  /// This method transforms the data model to a domain entity, which is used
  /// in the application's business logic. It also handles the parsing of
  /// the `type` field into a [ChatType] enum and converts `createdAt` to a [DateTime] object.
  ChatEntity toEntity() {
    return ChatEntity(
      id: id,
      title: title,
      isPinned: isPinned,
      isArchived: isArchived,
      type: ChatType.values.valueFromString(type) ?? ChatType.group,
      description: description,
      createdAt: DateTime.tryParse(createdAt)?.toLocal(),
      participants: participants.map((e) => e.toEntity()).toList(),
      messages: messages.map((e) => e.toEntity()).toList(),
    );
  }
}
