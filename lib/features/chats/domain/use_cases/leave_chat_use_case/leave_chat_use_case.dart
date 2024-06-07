import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/chats/domain/repositories/chats_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'leave_chat_use_case.freezed.dart';
part 'leave_chat_use_case.g.dart';

/// The [LeaveChatUseCase] class implements the use case for leaving a chat.
/// This class follows the [UseCase] interface, with `void` as the return type
/// and [LeaveChatParams] as the parameters type.
class LeaveChatUseCase implements UseCase<void, LeaveChatParams> {
  /// Creates an instance of [LeaveChatUseCase].
  ///
  /// - `repository`: The repository that handles chat-related operations.
  const LeaveChatUseCase({
    required this.repository,
  });

  /// The repository that handles chat-related operations.
  final ChatsRepository repository;

  /// Calls the use case to leave a chat with the given parameters.
  ///
  /// This method uses the repository to leave a chat and returns a [Future]
  /// of [Either] containing [Failure] or `void`.
  @override
  Future<Either<Failure, void>> call(LeaveChatParams params) {
    return repository.leaveChat(params);
  }
}

/// The [LeaveChatParams] class represents the parameters required to leave a chat.
/// This class uses the `freezed` package to generate immutable value objects and includes JSON serialization.
@freezed
class LeaveChatParams with _$LeaveChatParams {
  /// Creates a [LeaveChatParams] instance.
  ///
  /// The factory constructor provides default values for the fields.
  ///
  /// - `chatId`: The unique identifier of the chat to leave, default is -1.
  const factory LeaveChatParams({
    @Default(-1) int chatId,
  }) = _LeaveChatParams;

  /// Private constructor for [LeaveChatParams].
  /// This is used by the `freezed` package to generate the implementation.
  const LeaveChatParams._();

  /// Creates a [LeaveChatParams] instance from a JSON object.
  ///
  /// This factory constructor uses the generated `_$LeaveChatParamsFromJson` function
  /// to deserialize the JSON map into a [LeaveChatParams] instance.
  factory LeaveChatParams.fromJson(Map<String, dynamic> json) =>
      _$LeaveChatParamsFromJson(json);
}
