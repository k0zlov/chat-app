import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_message_use_case.freezed.dart';

part 'delete_message_use_case.g.dart';

class DeleteMessageUseCase implements UseCase<void, DeleteMessageParams> {
  const DeleteMessageUseCase({
    required this.repository,
  });

  final ChatsRepository repository;

  @override
  Future<Either<Failure, void>> call(DeleteMessageParams params) {
    return repository.deleteMessage(params);
  }
}

@freezed
class DeleteMessageParams with _$DeleteMessageParams {
  const factory DeleteMessageParams({
    required int messageId,
  }) = _DeleteMessageParams;

  const DeleteMessageParams._();

  factory DeleteMessageParams.fromJson(Map<String, dynamic> json) =>
      _$DeleteMessageParamsFromJson(json);
}
