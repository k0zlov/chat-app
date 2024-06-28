import 'package:chat_app/features/chats/domain/entities/chat_participant_entity/chat_participant_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_participants_response_entity.freezed.dart';

@freezed
class ChatParticipantsResponseEntity with _$ChatParticipantsResponseEntity {
  const factory ChatParticipantsResponseEntity({
    @JsonKey(name: 'items')
    @Default([])
    List<ChatParticipantEntity> participants,
  }) = _ChatParticipantsResponseEntity;

  const ChatParticipantsResponseEntity._();
}
