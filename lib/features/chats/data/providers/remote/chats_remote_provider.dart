import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/network/api_endpoints.dart';
import 'package:chat_app/core/network/network.dart';
import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:chat_app/features/chats/data/models/chat_model/chat_model.dart';
import 'package:chat_app/features/chats/data/models/chat_participants_response_model/chat_participants_response_model.dart';
import 'package:chat_app/features/chats/data/models/chats_response_model/chats_response_model.dart';
import 'package:chat_app/features/chats/domain/use_cases/delete_chat_use_case/delete_chat_use_case.dart';
import 'package:chat_app/features/chats/domain/use_cases/search_chats_use_case/search_chats_use_case.dart';
import 'package:chat_app/features/chats/domain/use_cases/update_chat_use_case/update_chat_use_case.dart';
import 'package:chat_app/features/chats/domain/use_cases/update_participant_use_case/update_participant_use_case.dart';
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

  Future<Either<Failure, ChatsResponseModel>> searchChats(
    SearchChatsParams params,
  );

  Future<Either<Failure, ChatModel>> pinChat(
    int chatId,
  );

  Future<Either<Failure, ChatModel>> unpinChat(
    int chatId,
  );

  Future<Either<Failure, ChatModel>> archiveChat(
    int chatId,
  );

  Future<Either<Failure, ChatModel>> unarchiveChat(
    int chatId,
  );

  Future<Either<Failure, void>> deleteChat(
    DeleteChatParams params,
  );

  Future<Either<Failure, ChatModel>> updateChat(
    UpdateChatParams params,
  );

  Future<Either<Failure, ChatParticipantsResponseModel>> updateParticipant(
    UpdateParticipantParams params,
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

  @override
  Future<Either<Failure, ChatsResponseModel>> searchChats(
    SearchChatsParams params,
  ) async {
    final response = await network.get(
      url: ApiEndpoints.getChatsSearch,
      queryParameters: params.toJson(),
      parser: (json) {
        final data = json as Map<String, dynamic>;

        return ChatsResponseModel.fromJson(data);
      },
    );

    return response;
  }

  @override
  Future<Either<Failure, ChatModel>> archiveChat(int chatId) async {
    final response = await network.post(
      url: ApiEndpoints.postChatArchive,
      queryParameters: {'chatId': chatId},
      parser: (json) {
        final data = json as Map<String, dynamic>;
        return ChatModel.fromJson(data);
      },
    );

    return response;
  }

  @override
  Future<Either<Failure, ChatModel>> unarchiveChat(int chatId) async {
    final response = await network.delete(
      url: ApiEndpoints.deleteChatUnarchive,
      queryParameters: {'chatId': chatId},
      parser: (json) {
        final data = json as Map<String, dynamic>;
        return ChatModel.fromJson(data);
      },
    );

    return response;
  }

  @override
  Future<Either<Failure, ChatModel>> pinChat(int chatId) async {
    final response = await network.post(
      url: ApiEndpoints.postChatPin,
      queryParameters: {'chatId': chatId},
      parser: (json) {
        final data = json as Map<String, dynamic>;
        return ChatModel.fromJson(data);
      },
    );

    return response;
  }

  @override
  Future<Either<Failure, ChatModel>> unpinChat(int chatId) async {
    final response = await network.delete(
      url: ApiEndpoints.deleteChatUnpin,
      queryParameters: {'chatId': chatId},
      parser: (json) {
        final data = json as Map<String, dynamic>;
        return ChatModel.fromJson(data);
      },
    );

    return response;
  }

  @override
  Future<Either<Failure, void>> deleteChat(
    DeleteChatParams params,
  ) async {
    final response = await network.delete(
      url: ApiEndpoints.deleteChatDelete,
      queryParameters: params.toJson(),
      parser: (_) => null,
    );

    return response;
  }

  @override
  Future<Either<Failure, ChatModel>> updateChat(
    UpdateChatParams params,
  ) async {
    final response = await network.put(
      url: ApiEndpoints.putChatUpdate,
      data: params.toJson(),
      parser: (json) {
        final data = json as Map<String, dynamic>;
        return ChatModel.fromJson(data);
      },
    );

    return response;
  }

  @override
  Future<Either<Failure, ChatParticipantsResponseModel>> updateParticipant(
    UpdateParticipantParams params,
  ) async {
    final response = await network.put(
      url: ApiEndpoints.putParticipantUpdate,
      data: params.toJson(),
      parser: (json) {
        json as Map<String, dynamic>;
        return ChatParticipantsResponseModel.fromJson(json);
      },
    );

    return response;
  }
}
