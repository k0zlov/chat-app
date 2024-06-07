import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:dartz/dartz.dart';

/// The [EraseChatsUseCase] class implements the use case for erasing all chats.
/// This class follows the [UseCase] interface, with `void` as the return type
/// and [NoParams] as the parameters type.
class EraseChatsUseCase implements UseCase<void, NoParams> {
  /// Creates an instance of [EraseChatsUseCase].
  ///
  /// - `repository`: The repository that handles chat-related operations.
  const EraseChatsUseCase({
    required this.repository,
  });

  /// The repository that handles chat-related operations.
  final ChatsRepository repository;

  /// Calls the use case to erase all chats with the given parameters.
  ///
  /// This method uses the repository to delete all chats and returns a [Future]
  /// of [Either] containing [Failure] or `void`.
  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return repository.deleteAllChats();
  }
}
