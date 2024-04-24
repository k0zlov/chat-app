import 'package:chat_app/features/chats/data/models/message_model/message_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'messages_response_model.freezed.dart';
part 'messages_response_model.g.dart';

@freezed
class MessagesResponseModel with _$MessagesResponseModel {
  const factory MessagesResponseModel({
    @JsonKey(name: 'items') @Default([]) List<MessageModel> messages,
  }) = _MessagesResponseModel;

  const MessagesResponseModel._();

  factory MessagesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MessagesResponseModelFromJson(json);
}
