import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_model.freezed.dart';

part 'message_model.g.dart';

/// Represents a response containing a list of message models.
@freezed
class MessageResponse with _$MessageResponse {
  /// Default constructor for [MessageResponse].
  const factory MessageResponse({
    @JsonKey(name: 'items') @Default([]) List<MessageModel> messages,
  }) = _MessageResponse;

  const MessageResponse._();

  /// Creates a [MessageResponse] instance from JSON data.
  factory MessageResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseFromJson(json);
}

/// Represents a message model.
@freezed
class MessageModel with _$MessageModel {
  /// Default constructor for [MessageModel].
  const factory MessageModel({
    @Default(0) int messageid,
    @Default(0) int chatid,
    @Default(0) int userid,
    @Default('') String content,
    @JsonKey(name: 'createdat') @Default('') String createdAt,
  }) = _MessageModel;

  const MessageModel._();

  /// Creates a [MessageModel] instance from JSON data.
  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
}
