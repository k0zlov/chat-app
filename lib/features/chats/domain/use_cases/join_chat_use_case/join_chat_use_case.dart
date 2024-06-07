import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'join_chat_use_case.freezed.dart';

part 'join_chat_use_case.g.dart';

class JoinChatUseCase implements UseCase<ChatEntity, JoinChatParams> {
  const JoinChatUseCase({
    required this.repository,
  });

  final ChatsRepository repository;

  @override
  Future<Either<Failure, ChatEntity>> call(JoinChatParams params) {
    return repository.joinChat(params);
  }
}

@freezed
class JoinChatParams with _$JoinChatParams {
  const factory JoinChatParams({
    @Default(-1) int chatId,
  }) = _JoinChatParams;

  const JoinChatParams._();

  factory JoinChatParams.fromJson(Map<String, dynamic> json) =>
      _$JoinChatParamsFromJson(json);
}
