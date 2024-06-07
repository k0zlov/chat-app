import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/chats/domain/repositories/chats_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'leave_chat_use_case.freezed.dart';

part 'leave_chat_use_case.g.dart';

class LeaveChatUseCase implements UseCase<void, LeaveChatParams> {
  const LeaveChatUseCase({
    required this.repository,
  });

  final ChatsRepository repository;

  @override
  Future<Either<Failure, void>> call(LeaveChatParams params) {
    return repository.leaveChat(params);
  }
}

@freezed
class LeaveChatParams with _$LeaveChatParams {
  const factory LeaveChatParams({
    @Default(-1) int chatId,
  }) = _LeaveChatParams;

  const LeaveChatParams._();

  factory LeaveChatParams.fromJson(Map<String, dynamic> json) =>
      _$LeaveChatParamsFromJson(json);
}
