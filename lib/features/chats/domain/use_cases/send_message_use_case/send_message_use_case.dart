import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:chat_app/features/chats/domain/entities/message_entity/message_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_message_use_case.freezed.dart';
part 'send_message_use_case.g.dart';

/// The [SendMessageUseCase] class implements the use case for sending a message.
/// This class follows the [UseCase] interface, using [MessageEntity] as the return type
/// and [SendMessageParams] as the parameters type.
class SendMessageUseCase implements UseCase<MessageEntity, SendMessageParams> {
  /// Creates an instance of [SendMessageUseCase].
  ///
  /// - `repository`: The repository that handles chat-related operations.
  const SendMessageUseCase({
    required this.repository,
  });

  /// The repository that handles chat-related operations.
  final ChatsRepository repository;

  /// Calls the use case to send a message with the given parameters.
  ///
  /// This method uses the repository to send a message and returns a [Future]
  /// of [Either] containing [Failure] or [MessageEntity].
  @override
  Future<Either<Failure, MessageEntity>> call(SendMessageParams params) {
    return repository.sendMessage(params);
  }
}

/// The [SendMessageParams] class represents the parameters required to send a message.
/// This class uses the `freezed` package to generate immutable value objects and includes JSON serialization.
@freezed
class SendMessageParams with _$SendMessageParams {
  /// Creates a [SendMessageParams] instance.
  ///
  /// The factory constructor provides default values for the fields.
  ///
  /// - `chatId`: The unique identifier of the chat where the message is sent, default is -1.
  /// - `content`: The content of the message, default is an empty string.
  const factory SendMessageParams({
    @Default(-1) int chatId,
    @Default('') String content,
  }) = _SendMessageParams;

  /// Private constructor for [SendMessageParams].
  /// This is used by the `freezed` package to generate the implementation.
  const SendMessageParams._();

  /// Creates a [SendMessageParams] instance from a JSON object.
  ///
  /// This factory constructor uses the generated `_$SendMessageParamsFromJson` function
  /// to deserialize the JSON map into a [SendMessageParams] instance.
  factory SendMessageParams.fromJson(Map<String, dynamic> json) =>
      _$SendMessageParamsFromJson(json);
}
