import 'package:chat_app/features/chats/domain/entities/message_entity/message_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
class MessageModel with _$MessageModel {
  const factory MessageModel({
    @Default(-1) int id,
    @Default(-1) int chatId,
    @Default(-1) int userId,
    @Default('') String content,
    @Default('') String updatedAt,
    @Default('') String createdAt,
  }) = _MessageModel;

  const MessageModel._();

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  MessageEntity toEntity() {
    return MessageEntity(
      id: id,
      userId: userId,
      chatId: chatId,
      content: content,
      createdAt: DateTime.tryParse(createdAt) ?? DateTime.now(),
      updatedAt: DateTime.tryParse(updatedAt) ?? DateTime.now(),
    );
  }
}
