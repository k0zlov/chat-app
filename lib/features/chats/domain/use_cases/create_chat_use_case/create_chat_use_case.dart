import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_chat_use_case.freezed.dart';

part 'create_chat_use_case.g.dart';

class CreateChatUseCase implements UseCase<ChatEntity, CreateChatParams> {
  const CreateChatUseCase({
    required this.repository,
  });

  final ChatsRepository repository;

  @override
  Future<Either<Failure, ChatEntity>> call(CreateChatParams params) {
    return repository.createChat(params);
  }
}

@freezed
class CreateChatParams with _$CreateChatParams {
  const factory CreateChatParams({
    @Default('') String title,
    @Default(null) String? chatType,
    @Default(null) String? description,
  }) = _CreateChatParams;

  const CreateChatParams._();

  factory CreateChatParams.fromJson(Map<String, dynamic> json) =>
      _$CreateChatParamsFromJson(json);
}
