import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:dartz/dartz.dart';

class EraseChatsUseCase implements UseCase<void, NoParams> {
  const EraseChatsUseCase({
    required this.repository,
  });

  final ChatsRepository repository;

  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return repository.deleteAllChats();
  }
}
