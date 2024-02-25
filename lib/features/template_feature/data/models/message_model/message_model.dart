import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_model.freezed.dart';

part 'message_model.g.dart';

@freezed
class MessageResponse with _$MessageResponse {
  const factory MessageResponse({
    @JsonKey(name: 'items') @Default([]) List<MessageModel> messages,
  }) = _MessageResponse;

  const MessageResponse._();

  factory MessageResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseFromJson(json);
}


@freezed
class MessageModel with _$MessageModel {
  const factory MessageModel({
    @Default(0) int messageid,
    @Default(0) int chatid,
    @Default(0) int userid,
    @Default('') String content,
    @JsonKey(name: 'createdat') @Default('') String createdAt,
  }) = _MessageModel;

  const MessageModel._();

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
}