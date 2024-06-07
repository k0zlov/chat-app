import 'package:chat_app/features/chats/domain/entities/chat_participant_entity/chat_participant_entity.dart';
import 'package:chat_app/utils/enum_parsing/enum_parsing_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_participant_model.freezed.dart';

part 'chat_participant_model.g.dart';

@freezed
class ChatParticipantModel with _$ChatParticipantModel {
  const factory ChatParticipantModel({
    @Default(-1) int chatId,
    @Default(-1) int userId,
    @Default('') String name,
    @Default('') String role,
    @Default('') String joinedAt,
  }) = _ChatParticipantModel;

  const ChatParticipantModel._();

  factory ChatParticipantModel.fromJson(Map<String, dynamic> json) =>
      _$ChatParticipantModelFromJson(json);

  ChatParticipantEntity toEntity() {
    return ChatParticipantEntity(
      chatId: chatId,
      userId: userId,
      name: name,
      role: ChatParticipantRole.values.valueFromString(role) ??
          ChatParticipantRole.member,
      joinedAt: DateTime.tryParse(joinedAt),
    );
  }
}
