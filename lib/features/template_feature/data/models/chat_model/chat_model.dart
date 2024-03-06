import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_model.freezed.dart';

part 'chat_model.g.dart';

/// Represents a response containing a list of chat models.
@freezed
class ChatResponse with _$ChatResponse {
  /// Default constructor for [ChatResponse].
  const factory ChatResponse({
    @JsonKey(name: 'items') @Default([]) List<ChatModel> chats,
  }) = _ChatResponse;

  const ChatResponse._();

  /// Creates a [ChatResponse] instance from JSON data.
  factory ChatResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatResponseFromJson(json);
}

/// Represents a chat model.
@freezed
class ChatModel with _$ChatModel {
  /// Default constructor for [ChatModel].
  const factory ChatModel({
    @JsonKey(name: 'chat_id') @Default(0) int chatId,
    @JsonKey(name: 'chat_type') @Default('') String chatType,
    @JsonKey(name: 'created_at') @Default('') String createdAt,
}) = _ChatModel;

  const ChatModel._();

  /// Creates a [ChatModel] instance from JSON data.
  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);
}
