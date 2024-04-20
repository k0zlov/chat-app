import 'package:chat_app/features/chats/data/models/chat_model/chat_model.dart';
import 'package:chat_app/features/chats/domain/entities/chats_response_entity/chats_response_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chats_response_model.freezed.dart';

part 'chats_response_model.g.dart';

@freezed
class ChatsResponseModel with _$ChatsResponseModel {
  const factory ChatsResponseModel({
    @JsonKey(name: 'items') @Default([]) List<ChatModel> chats,
  }) = _ChatsResponseModel;

  const ChatsResponseModel._();

  factory ChatsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ChatsResponseModelFromJson(json);

  ChatsResponseEntity toEntity() {
    return ChatsResponseEntity(
      chats: chats.map((e) => e.toEntity()).toList(),
    );
  }
}
