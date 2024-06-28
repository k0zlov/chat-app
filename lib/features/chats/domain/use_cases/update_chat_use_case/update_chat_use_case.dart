import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_chat_use_case.freezed.dart';

part 'update_chat_use_case.g.dart';

class UpdateChatUseCase implements UseCase<ChatEntity, UpdateChatParams> {
  const UpdateChatUseCase({
    required this.repository,
  });

  final ChatsRepository repository;

  @override
  Future<Either<Failure, ChatEntity>> call(UpdateChatParams params) {
    return repository.updateChat(params);
  }
}

@freezed
class UpdateChatParams with _$UpdateChatParams {
  const factory UpdateChatParams({
    required int chatId,
    @Default(null) String? title,
    @Default(null) String? description,
    @Default(ChatType) ChatType? chatType,
  }) = _UpdateChatParams;

  const UpdateChatParams._();

  factory UpdateChatParams.fromJson(Map<String, dynamic> json) =>
      _$UpdateChatParamsFromJson(json);
}
