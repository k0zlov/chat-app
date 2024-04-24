import 'package:chat_app/features/chats/data/models/chat_participant_model/chat_participant_model.dart';
import 'package:chat_app/features/chats/data/models/message_model/message_model.dart';
import 'package:chat_app/features/chats/domain/entities/chat_entity/chat_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_model.freezed.dart';

part 'chat_model.g.dart';

@freezed
class ChatModel with _$ChatModel {
  const factory ChatModel({
    @JsonKey(name: 'id') @Default(-1) int externalId,
    @Default(-1) int userId,
    @Default('') String title,
    @Default('') String description,
    @Default('') String createdAt,
    @Default('') String updatedAt,
    @Default([]) List<MessageModel> messages,
    @JsonKey(name: 'Participants')
    @Default([])
    List<ChatParticipantModel> participants,
  }) = _ChatModel;

  const ChatModel._();

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);

  ChatEntity toEntity() {
    return ChatEntity(
      id: externalId,
      userId: userId,
      title: title,
      description: description,
      createdAt: DateTime.tryParse(createdAt) ?? DateTime.now(),
      updatedAt: DateTime.tryParse(updatedAt) ?? DateTime.now(),
      participants: participants.map((e) => e.toEntity()).toList(),
      messages: messages.map((e) => e.toEntity()).toList(),
    );
  }
}
