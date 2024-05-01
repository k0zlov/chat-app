import 'package:chat_app/features/chats/domain/entities/chat_participant_entity/chat_participant_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_participant_model.freezed.dart';

part 'chat_participant_model.g.dart';

@freezed
class ChatParticipantModel with _$ChatParticipantModel {
  const factory ChatParticipantModel({
    @JsonKey(name: 'id') @Default(-1) int externalId,
    @Default(-1) int userId,
    @Default('') String createdAt,
  }) = _ChatParticipantModel;

  const ChatParticipantModel._();

  factory ChatParticipantModel.fromJson(Map<String, dynamic> json) =>
      _$ChatParticipantModelFromJson(json);

  ChatParticipantEntity toEntity() {
    return ChatParticipantEntity(
      id: externalId,
      userId: userId,
      createdAt: DateTime.tryParse(createdAt),
    );
  }
}
