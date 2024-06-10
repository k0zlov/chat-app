import 'package:chat_app/features/chats/domain/entities/message_entity/message_entity.dart';
import 'package:chat_app/utils/enum_parsing/enum_parsing_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_model.freezed.dart';

part 'message_model.g.dart';

/// The [MessageModel] class represents the data model for a message.
/// This class uses the `freezed` package to generate immutable
/// value objects and includes JSON serialization.
@freezed
class MessageModel with _$MessageModel {
  /// Creates a [MessageModel] instance.
  ///
  /// The factory constructor provides default values for the fields.
  ///
  /// - `id`: The unique identifier of the message, default is -1.
  /// - `chatId`: The unique identifier of the chat the message belongs to, default is -1.
  /// - `userId`: The unique identifier of the user who sent the message, default is -1.
  /// - `content`: The content of the message, default is an empty string.
  /// - `content`: The type of the message, default is an empty string.
  /// - `content`: The name of the message author, default is an empty string.
  /// - `updatedAt`: The date when the message was last updated in ISO 8601 format, default is an empty string.
  /// - `createdAt`: The date when the message was created in ISO 8601 format, default is an empty string.
  const factory MessageModel({
    @Default(-1) int id,
    @Default(-1) int chatId,
    @Default(-1) int userId,
    @Default('') String content,
    @Default('') String authorName,
    @Default('') String type,
    @Default('') String updatedAt,
    @Default('') String createdAt,
  }) = _MessageModel;

  /// Private constructor for [MessageModel].
  /// This is used by the `freezed` package to generate the implementation.
  const MessageModel._();

  /// Creates a [MessageModel] instance from a JSON object.
  ///
  /// This factory constructor uses the generated `_$MessageModelFromJson` function
  /// to deserialize the JSON map into a [MessageModel] instance.
  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  /// Converts the [MessageModel] instance to a [MessageEntity].
  ///
  /// This method transforms the data model to a domain entity, which is used
  /// in the application's business logic. It also handles the parsing of
  /// `createdAt` and `updatedAt` to [DateTime] objects, defaulting to the current
  /// date and time if parsing fails.
  MessageEntity toEntity() {
    return MessageEntity(
      id: id,
      userId: userId,
      chatId: chatId,
      content: content,
      authorName: authorName,
      type: MessageType.values.valueFromString(type) ?? MessageType.basic,
      createdAt: DateTime.tryParse(createdAt) ?? DateTime.now(),
      updatedAt: DateTime.tryParse(updatedAt) ?? DateTime.now(),
    );
  }
}
