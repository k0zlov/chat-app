import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_entity.freezed.dart';

@freezed
class MessageEntity with _$MessageEntity {
  const factory MessageEntity({
    @Default(-1) int id,
    @Default(-1) int chatId,
    @Default(-1) int userId,
    @Default('') String content,
    required DateTime updatedAt,
    required DateTime createdAt,
  }) = _MessageEntity;

  const MessageEntity._();
}
