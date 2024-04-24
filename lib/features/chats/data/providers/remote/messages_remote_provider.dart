import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/network/api_endpoints.dart';
import 'package:chat_app/core/network/network.dart';
import 'package:chat_app/features/chats/data/models/message_model/message_model.dart';
import 'package:chat_app/features/chats/data/models/messages_response_model/messages_response_model.dart';
import 'package:chat_app/features/chats/domain/use_cases/send_message_use_case/send_message_use_case.dart';
import 'package:dartz/dartz.dart';

abstract class MessagesRemoteProvider {
  Future<Either<Failure, MessageModel>> sendMessage(
    SendMessageParams params,
  );

  Future<Either<Failure, MessagesResponseModel>> getMessages(
    int chatId,
  );
}

class MessagesRemoteProviderImpl implements MessagesRemoteProvider {
  const MessagesRemoteProviderImpl({
    required this.network,
  });

  final Network network;

  @override
  Future<Either<Failure, MessagesResponseModel>> getMessages(
    int chatId,
  ) async {
    final response = await network.get(
      url: '${ApiEndpoints.getMessages}/$chatId',
      parser: (json) {
        final data = json as Map<String, dynamic>;

        return MessagesResponseModel.fromJson(data);
      },
    );

    return response;
  }

  @override
  Future<Either<Failure, MessageModel>> sendMessage(
    SendMessageParams params,
  ) async {
    final response = await network.post(
      url: ApiEndpoints.postSendMessage,
      data: params.toJson(),
      parser: (json) {
        final data = json as Map<String, dynamic>;

        return MessageModel.fromJson(data);
      },
    );

    return response;
  }
}
