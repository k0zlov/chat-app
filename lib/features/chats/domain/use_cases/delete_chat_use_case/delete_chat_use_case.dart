import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_chat_use_case.freezed.dart';

part 'delete_chat_use_case.g.dart';

class DeleteChatUseCase implements UseCase<void, DeleteChatParams> {
  const DeleteChatUseCase({
    required this.repository,
  });

  final ChatsRepository repository;

  @override
  Future<Either<Failure, void>> call(DeleteChatParams params) {
    return repository.deleteChat(params);
  }
}

@freezed
class DeleteChatParams with _$DeleteChatParams {
  const factory DeleteChatParams({
    required int chatId,
  }) = _DeleteChatParams;

  const DeleteChatParams._();

  factory DeleteChatParams.fromJson(Map<String, dynamic> json) =>
      _$DeleteChatParamsFromJson(json);
}
