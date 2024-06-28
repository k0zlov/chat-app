import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/network/api_endpoints.dart';
import 'package:chat_app/core/network/network.dart';
import 'package:chat_app/features/chats/data/models/message_model/message_model.dart';
import 'package:chat_app/features/chats/domain/use_cases/delete_message_use_case/delete_message_use_case.dart';
import 'package:chat_app/features/chats/domain/use_cases/send_message_use_case/send_message_use_case.dart';
import 'package:chat_app/features/chats/domain/use_cases/update_message_use_case/update_message_use_case.dart';
import 'package:dartz/dartz.dart';

abstract class MessagesRemoteProvider {
  Future<Either<Failure, MessageModel>> sendMessage(
    SendMessageParams params,
  );

  Future<Either<Failure, MessageModel>> updateMessage(
    UpdateMessageParams params,
  );

  Future<Either<Failure, void>> deleteMessage(
    DeleteMessageParams params,
  );
}

class MessagesRemoteProviderImpl implements MessagesRemoteProvider {
  const MessagesRemoteProviderImpl({
    required this.network,
  });

  final Network network;

  @override
  Future<Either<Failure, MessageModel>> sendMessage(
    SendMessageParams params,
  ) async {
    final response = await network.post(
      url: ApiEndpoints.postMessageSend,
      data: params.toJson(),
      parser: (json) {
        final data = json as Map<String, dynamic>;

        return MessageModel.fromJson(data);
      },
    );

    return response;
  }

  @override
  Future<Either<Failure, void>> deleteMessage(
    DeleteMessageParams params,
  ) async {
    final response = await network.delete(
      url: ApiEndpoints.deleteMessageDelete,
      queryParameters: params.toJson(),
      parser: (_) => null,
    );

    return response;
  }

  @override
  Future<Either<Failure, MessageModel>> updateMessage(
    UpdateMessageParams params,
  ) async {
    final response = await network.put(
      url: ApiEndpoints.putMessageUpdate,
      data: params.toJson(),
      parser: (json) {
        json as Map<String, dynamic>;
        return MessageModel.fromJson(json);
      },
    );

    return response;
  }
}
