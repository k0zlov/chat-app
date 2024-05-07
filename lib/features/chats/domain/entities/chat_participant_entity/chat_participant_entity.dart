import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_participant_entity.freezed.dart';

@freezed
class ChatParticipantEntity with _$ChatParticipantEntity {
  const factory ChatParticipantEntity({
    @Default(-1) int id,
    @Default(-1) int userId,
    @Default(null) DateTime? createdAt,
  }) = _ChatParticipantEntity;

  const ChatParticipantEntity._();
}
