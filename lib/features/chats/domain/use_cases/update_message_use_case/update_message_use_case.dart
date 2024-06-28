import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:chat_app/features/chats/domain/entities/message_entity/message_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_message_use_case.freezed.dart';
part 'update_message_use_case.g.dart';

class UpdateMessageUseCase
    implements UseCase<MessageEntity, UpdateMessageParams> {
  const UpdateMessageUseCase({
    required this.repository,
  });

  final ChatsRepository repository;

  @override
  Future<Either<Failure, MessageEntity>> call(UpdateMessageParams params) {
    return repository.updateMessage(params);
  }
}

@freezed
class UpdateMessageParams with _$UpdateMessageParams {
  const factory UpdateMessageParams({
    required int messageId,
    required String content,
  }) = _UpdateMessageParams;

  const UpdateMessageParams._();

  factory UpdateMessageParams.fromJson(Map<String, dynamic> json) =>
      _$UpdateMessageParamsFromJson(json);
}
