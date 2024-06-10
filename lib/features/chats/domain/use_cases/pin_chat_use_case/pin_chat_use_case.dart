import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pin_chat_use_case.freezed.dart';

part 'pin_chat_use_case.g.dart';

class PinChatUseCase implements UseCase<ChatEntity, PinChatParams> {
  const PinChatUseCase({
    required this.repository,
  });

  final ChatsRepository repository;

  @override
  Future<Either<Failure, ChatEntity>> call(PinChatParams params) {
    return repository.updatePinChat(params);
  }
}

@freezed
class PinChatParams with _$PinChatParams {
  const factory PinChatParams({
    required bool isPinned,
    @Default(-1) int chatId,
  }) = _PinChatParams;

  const PinChatParams._();

  factory PinChatParams.fromJson(Map<String, dynamic> json) =>
      _$PinChatParamsFromJson(json);
}
