import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:chat_app/features/chats/domain/entities/message_entity/message_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_message_use_case.freezed.dart';

part 'send_message_use_case.g.dart';

class SendMessageUseCase implements UseCase<MessageEntity, SendMessageParams> {
  const SendMessageUseCase({
    required this.repository,
  });

  final ChatsRepository repository;

  @override
  Future<Either<Failure, MessageEntity>> call(SendMessageParams params) {
    return repository.sendMessage(params);
  }
}

@freezed
class SendMessageParams with _$SendMessageParams {
  const factory SendMessageParams({
    @Default(-1) int chatId,
    @Default('') String content,
  }) = _SendMessageParams;

  const SendMessageParams._();

  factory SendMessageParams.fromJson(Map<String, dynamic> json) =>
      _$SendMessageParamsFromJson(json);
}
