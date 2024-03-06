import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_participants_model.freezed.dart';

part 'chat_participants_model.g.dart';

/// Represents a response containing a list of chat models.
@freezed
class ChatParticipantsResponse with _$ChatParticipantsResponse {
  /// Default constructor for [ChatParticipantsResponse].
  const factory ChatParticipantsResponse({
    @JsonKey(name: 'items')
    @Default([])
    List<ChatParticipantsModel> chatParticipants,
  }) = _ChatParticipantsResponse;

  const ChatParticipantsResponse._();

  /// Creates a [ChatParticipantsResponse] instance from JSON data.
  factory ChatParticipantsResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatParticipantsResponseFromJson(json);
}

/// Represents a chat model.
@freezed
class ChatParticipantsModel with _$ChatParticipantsModel {
  /// Default constructor for [ChatParticipantsModel].
  const factory ChatParticipantsModel({
    @JsonKey(name: 'chat_id') @Default(0) int chatId,
    @JsonKey(name: 'user_id') @Default(0) int userId,
    @Default('') String role,
    @JsonKey(name: 'joined_at') @Default('') String joinedAt,
  }) = _ChatParticipantsModel;

  const ChatParticipantsModel._();

  /// Creates a [ChatParticipantsModel] instance from JSON data.
  factory ChatParticipantsModel.fromJson(Map<String, dynamic> json) =>
      _$ChatParticipantsModelFromJson(json);
}
