import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/chats/domain/entities/chats_response_entity/chats_response_entity.dart';
import 'package:chat_app/features/chats/domain/repositories/chats_repository.dart';
import 'package:dartz/dartz.dart';

class GetSavedChatsUseCase implements UseCase<ChatsResponseEntity, NoParams> {
  const GetSavedChatsUseCase({
    required this.repository,
  });

  final ChatsRepository repository;

  @override
  Future<Either<Failure, ChatsResponseEntity>> call(NoParams params) {
    return repository.getSavedChats();
  }
}
