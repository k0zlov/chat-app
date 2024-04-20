import 'package:chat_app/features/chats/domain/entities/chat_entity/chat_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chats_response_entity.freezed.dart';

@freezed
class ChatsResponseEntity with _$ChatsResponseEntity {
  const factory ChatsResponseEntity({
    @Default([]) List<ChatEntity> chats,
  }) = _ChatsResponseEntity;

  const ChatsResponseEntity._();
}
