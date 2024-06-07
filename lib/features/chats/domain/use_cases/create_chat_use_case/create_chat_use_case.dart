import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_chat_use_case.freezed.dart';
part 'create_chat_use_case.g.dart';

/// The [CreateChatUseCase] class implements the use case for creating a chat.
/// This class follows the [UseCase] interface, using [ChatEntity] as the return type
/// and [CreateChatParams] as the parameters type.
class CreateChatUseCase implements UseCase<ChatEntity, CreateChatParams> {
  /// Creates an instance of [CreateChatUseCase].
  ///
  /// - `repository`: The repository that handles chat-related operations.
  const CreateChatUseCase({
    required this.repository,
  });

  /// The repository that handles chat-related operations.
  final ChatsRepository repository;

  /// Calls the use case to create a chat with the given parameters.
  ///
  /// This method uses the repository to create a chat and returns a [Future]
  /// of [Either] containing [Failure] or [ChatEntity].
  @override
  Future<Either<Failure, ChatEntity>> call(CreateChatParams params) {
    return repository.createChat(params);
  }
}

/// The [CreateChatParams] class represents the parameters required to create a chat.
/// This class uses the `freezed` package to generate immutable value objects and includes JSON serialization.
@freezed
class CreateChatParams with _$CreateChatParams {
  /// Creates a [CreateChatParams] instance.
  ///
  /// The factory constructor provides default values for the fields.
  ///
  /// - `title`: The title of the chat, default is an empty string.
  /// - `chatType`: The type of the chat (e.g., private, group), default is null.
  /// - `description`: An optional description of the chat, default is null.
  const factory CreateChatParams({
    @Default('') String title,
    @Default(null) String? chatType,
    @Default(null) String? description,
  }) = _CreateChatParams;

  /// Private constructor for [CreateChatParams].
  /// This is used by the `freezed` package to generate the implementation.
  const CreateChatParams._();

  /// Creates a [CreateChatParams] instance from a JSON object.
  ///
  /// This factory constructor uses the generated `_$CreateChatParamsFromJson` function
  /// to deserialize the JSON map into a [CreateChatParams] instance.
  factory CreateChatParams.fromJson(Map<String, dynamic> json) =>
      _$CreateChatParamsFromJson(json);
}
