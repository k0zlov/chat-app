import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/network/api_endpoints.dart';
import 'package:chat_app/core/network/network.dart';
import 'package:chat_app/features/chats/data/models/chat_model/chat_model.dart';
import 'package:chat_app/features/chats/data/models/chats_response_model/chats_response_model.dart';
import 'package:chat_app/features/chats/domain/use_cases/create_chat_use_case/create_chat_use_case.dart';
import 'package:chat_app/features/chats/domain/use_cases/join_chat_use_case/join_chat_use_case.dart';
import 'package:chat_app/features/chats/domain/use_cases/leave_chat_use_case/leave_chat_use_case.dart';
import 'package:dartz/dartz.dart';

abstract interface class ChatsRemoteProvider {
  Future<Either<Failure, ChatsResponseModel>> fetchChats();

  Future<Either<Failure, ChatModel>> joinChat(
    JoinChatParams params,
  );

  Future<Either<Failure, void>> leaveChat(
    LeaveChatParams params,
  );

  Future<Either<Failure, ChatModel>> createChat(
    CreateChatParams params,
  );
}

class ChatsRemoteProviderImpl implements ChatsRemoteProvider {
  const ChatsRemoteProviderImpl({
    required this.network,
  });

  final Network network;

  @override
  Future<Either<Failure, ChatModel>> createChat(
    CreateChatParams params,
  ) async {
    final response = await network.post(
      url: ApiEndpoints.postChatCreate,
      data: params.toJson(),
      parser: (json) {
        final data = json as Map<String, dynamic>;
        return ChatModel.fromJson(data);
      },
    );

    return response;
  }

  @override
  Future<Either<Failure, ChatsResponseModel>> fetchChats() async {
    final response = await network.get(
      url: ApiEndpoints.getChats,
      parser: (json) {
        final data = json as Map<String, dynamic>;
        return ChatsResponseModel.fromJson(data);
      },
    );

    return response;
  }

  @override
  Future<Either<Failure, ChatModel>> joinChat(
    JoinChatParams params,
  ) async {
    final response = await network.post(
      url: ApiEndpoints.postChatJoin,
      data: params.toJson(),
      parser: (json) {
        final data = json as Map<String, dynamic>;
        return ChatModel.fromJson(data);
      },
    );

    return response;
  }

  @override
  Future<Either<Failure, void>> leaveChat(
    LeaveChatParams params,
  ) async {
    final response = await network.post(
      url: ApiEndpoints.postChatLeave,
      data: params.toJson(),
      parser: (json) => null,
    );

    return response;
  }
}
