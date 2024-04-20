import 'package:chat_app/features/chats/domain/entities/chat_participant_entity/chat_participant_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_entity.freezed.dart';

@freezed
class ChatEntity with _$ChatEntity {
  const factory ChatEntity({
    @Default(-1) int id,
    @Default(-1) int userId,
    @Default('') String title,
    @Default(null) String? description,
    @Default(null) DateTime? createdAt,
    @Default(null) DateTime? updatedAt,
    @Default([]) List<ChatParticipantEntity> participants,
  }) = _ChatEntity;

  const ChatEntity._();
}