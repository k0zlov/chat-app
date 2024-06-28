import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_entity.freezed.dart';

/// Enum representing the types of messages.
enum MessageType {
  /// Basic user message
  basic,

  /// Info message such as user joining, leaving notification etc.
  info;

  bool get isInfo => this == info;
}

/// The [MessageEntity] class represents a message entity in the domain layer.
/// This class uses the `freezed` package to generate immutable value objects.
@freezed
class MessageEntity with _$MessageEntity {
  /// Creates a [MessageEntity] instance.
  ///
  /// The factory constructor provides default values for the fields.
  ///
  /// - `id`: The unique identifier of the message, default is -1.
  /// - `chatId`: The unique identifier of the chat the message belongs to, default is -1.
  /// - `userId`: The unique identifier of the user who sent the message, default is -1.
  /// - `content`: The content of the message, default is an empty string.
  /// - `type`: The type of message, default is [MessageType.basic].
  /// - `updatedAt`: The date and time when the message was last updated.
  /// - `createdAt`: The date and time when the message was created.
  const factory MessageEntity({
    required DateTime updatedAt,
    required DateTime createdAt,
    @Default(-1) int id,
    @Default(-1) int chatId,
    @Default(-1) int userId,
    @Default(MessageType.basic) MessageType type,
    @Default('') String content,
    @Default('') String authorName,
  }) = _MessageEntity;

  /// Private constructor for [MessageEntity].
  /// This is used by the `freezed` package to generate the implementation.
  const MessageEntity._();
}
