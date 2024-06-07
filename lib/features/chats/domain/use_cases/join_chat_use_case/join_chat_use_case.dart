import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'join_chat_use_case.freezed.dart';
part 'join_chat_use_case.g.dart';

/// The [JoinChatUseCase] class implements the use case for joining a chat.
/// This class follows the [UseCase] interface, using [ChatEntity] as the return type
/// and [JoinChatParams] as the parameters type.
class JoinChatUseCase implements UseCase<ChatEntity, JoinChatParams> {
  /// Creates an instance of [JoinChatUseCase].
  ///
  /// - `repository`: The repository that handles chat-related operations.
  const JoinChatUseCase({
    required this.repository,
  });

  /// The repository that handles chat-related operations.
  final ChatsRepository repository;

  /// Calls the use case to join a chat with the given parameters.
  ///
  /// This method uses the repository to join a chat and returns a [Future]
  /// of [Either] containing [Failure] or [ChatEntity].
  @override
  Future<Either<Failure, ChatEntity>> call(JoinChatParams params) {
    return repository.joinChat(params);
  }
}

/// The [JoinChatParams] class represents the parameters required to join a chat.
/// This class uses the `freezed` package to generate immutable value objects and includes JSON serialization.
@freezed
class JoinChatParams with _$JoinChatParams {
  /// Creates a [JoinChatParams] instance.
  ///
  /// The factory constructor provides default values for the fields.
  ///
  /// - `chatId`: The unique identifier of the chat to join, default is -1.
  const factory JoinChatParams({
    @Default(-1) int chatId,
  }) = _JoinChatParams;

  /// Private constructor for [JoinChatParams].
  /// This is used by the `freezed` package to generate the implementation.
  const JoinChatParams._();

  /// Creates a [JoinChatParams] instance from a JSON object.
  ///
  /// This factory constructor uses the generated `_$JoinChatParamsFromJson` function
  /// to deserialize the JSON map into a [JoinChatParams] instance.
  factory JoinChatParams.fromJson(Map<String, dynamic> json) =>
      _$JoinChatParamsFromJson(json);
}
