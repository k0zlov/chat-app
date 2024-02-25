import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_model.freezed.dart';

part 'chat_model.g.dart';

@freezed
class ChatResponse with _$ChatResponse {
  const factory ChatResponse({
    @JsonKey(name: 'items') @Default([]) List<ChatModel> chats,
  }) = _ChatResponse;

  const ChatResponse._();

  factory ChatResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatResponseFromJson(json);
}


@freezed
class ChatModel with _$ChatModel {
  const factory ChatModel({
    @Default(0) int chatid,
    @JsonKey(name: 'chattype') @Default('') String chatType,
    @JsonKey(name: 'createdat') @Default('') String createdAt,
}) = _ChatModel;

  const ChatModel._();

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);
}