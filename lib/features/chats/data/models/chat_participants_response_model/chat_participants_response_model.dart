import 'package:chat_app/features/chats/data/models/chat_participant_model/chat_participant_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_participants_response_model.freezed.dart';

part 'chat_participants_response_model.g.dart';

@freezed
class ChatParticipantsResponseModel with _$ChatParticipantsResponseModel {
  const factory ChatParticipantsResponseModel({
    @JsonKey(name: 'items')
    @Default([])
    List<ChatParticipantModel> participants,
  }) = _ChatParticipantsResponseModel;

  const ChatParticipantsResponseModel._();

  factory ChatParticipantsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ChatParticipantsResponseModelFromJson(json);
}
