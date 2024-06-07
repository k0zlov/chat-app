import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/chats/domain/entities/chats_response_entity/chats_response_entity.dart';
import 'package:chat_app/features/chats/domain/repositories/chats_repository.dart';
import 'package:dartz/dartz.dart';

/// The [GetUserChatsUseCase] class implements the use case for retrieving the user's chats.
/// This class follows the [UseCase] interface, using [ChatsResponseEntity] as the return type
/// and [NoParams] as the parameters type.
class GetUserChatsUseCase implements UseCase<ChatsResponseEntity, NoParams> {
  /// Creates an instance of [GetUserChatsUseCase].
  ///
  /// - `repository`: The repository that handles chat-related operations.
  const GetUserChatsUseCase({
    required this.repository,
  });

  /// The repository that handles chat-related operations.
  final ChatsRepository repository;

  /// Calls the use case to retrieve the user's chats with the given parameters.
  ///
  /// This method uses the repository to fetch the user's chats and returns a [Future]
  /// of [Either] containing [Failure] or [ChatsResponseEntity].
  @override
  Future<Either<Failure, ChatsResponseEntity>> call(NoParams params) {
    return repository.fetchChats();
  }
}
