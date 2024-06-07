import 'package:chat_app/features/chats/data/models/chat_participant_model/chat_participant_model.dart';
import 'package:chat_app/features/chats/data/models/message_model/message_model.dart';
import 'package:chat_app/features/chats/domain/entities/chat_entity/chat_entity.dart';
import 'package:chat_app/utils/enum_parsing/enum_parsing_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_model.freezed.dart';

part 'chat_model.g.dart';

@freezed
class ChatModel with _$ChatModel {
  const factory ChatModel({
    @Default(-1) int id,
    @Default('') String title,
    @Default('') String type,
    @Default(null) String? description,
    @Default('') String createdAt,
    @Default([]) List<MessageModel> messages,
    @Default([]) List<ChatParticipantModel> participants,
  }) = _ChatModel;

  const ChatModel._();

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);

  ChatEntity toEntity() {
    return ChatEntity(
      id: id,
      title: title,
      type: ChatType.values.valueFromString(type) ?? ChatType.group,
      description: description,
      createdAt: DateTime.tryParse(createdAt),
      participants: participants.map((e) => e.toEntity()).toList(),
      messages: messages.map((e) => e.toEntity()).toList(),
    );
  }
}
