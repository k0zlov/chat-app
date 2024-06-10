import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'archive_chat_use_case.freezed.dart';

part 'archive_chat_use_case.g.dart';

class ArchiveChatUseCase implements UseCase<ChatEntity, ArchiveChatParams> {
  const ArchiveChatUseCase({
    required this.repository,
  });

  final ChatsRepository repository;

  @override
  Future<Either<Failure, ChatEntity>> call(ArchiveChatParams params) {
    return repository.updateArchiveChat(params);
  }
}

@freezed
class ArchiveChatParams with _$ArchiveChatParams {
  const factory ArchiveChatParams({
    required bool isArchived,
    @Default(-1) int chatId,
  }) = _ArchiveChatParams;

  const ArchiveChatParams._();

  factory ArchiveChatParams.fromJson(Map<String, dynamic> json) =>
      _$ArchiveChatParamsFromJson(json);
}
