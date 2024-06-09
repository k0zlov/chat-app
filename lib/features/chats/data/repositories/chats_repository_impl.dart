import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:chat_app/features/chats/data/models/chat_model/chat_model.dart';
import 'package:chat_app/features/chats/data/providers/local/messages_local_provider.dart';
import 'package:chat_app/features/chats/data/providers/remote/messages_remote_provider.dart';
import 'package:chat_app/features/chats/domain/entities/chats_response_entity/chats_response_entity.dart';
import 'package:chat_app/features/chats/domain/entities/message_entity/message_entity.dart';
import 'package:chat_app/features/chats/domain/use_cases/search_chats_use_case/search_chats_use_case.dart';
import 'package:chat_app/features/chats/domain/use_cases/send_message_use_case/send_message_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

class ChatsRepositoryImpl implements ChatsRepository {
  const ChatsRepositoryImpl({
    required this.remoteProvider,
    required this.localProvider,
    required this.participantsLocalProvider,
    required this.messagesLocalProvider,
    required this.messagesRemoteProvider,
  });

  final ChatsRemoteProvider remoteProvider;
  final ChatsLocalProvider localProvider;

  final ChatParticipantsLocalProvider participantsLocalProvider;

  final MessagesLocalProvider messagesLocalProvider;
  final MessagesRemoteProvider messagesRemoteProvider;

  @override
  Future<Either<Failure, ChatEntity>> createChat(
    CreateChatParams params,
  ) async {
    final response = await remoteProvider.createChat(params);

    return response.fold(
      // ignore: unnecessary_lambdas
      (failure) => Left(failure),
      (model) async {
        await localProvider.cacheChat(model);

        await participantsLocalProvider.rewriteChatParticipants(
          chatId: model.id,
          participants: model.participants,
        );

        final ChatEntity entity = model.toEntity();

        return Right(entity);
      },
    );
  }

  @override
  Future<Either<Failure, ChatsResponseEntity>> getSavedChats() async {
    final response = await localProvider.getSavedChats();

    return response.fold(
      // ignore: unnecessary_lambdas
      (failure) => Left(failure),
      (model) async {
        final List<ChatModel> chats = [];

        for (ChatModel chat in model.chats) {
          final participantsResponse = await participantsLocalProvider
              .getSavedParticipants(chatId: chat.id);

          participantsResponse.fold(
            (failure) => null,
            (model) {
              chat = chat.copyWith(participants: model.participants);
            },
          );

          final messagesResponse = await messagesLocalProvider.getSavedMessages(
            chatId: chat.id,
          );

          messagesResponse.fold(
            (failure) => null,
            (model) {
              chat = chat.copyWith(messages: model.messages);
            },
          );

          chats.add(chat);
        }

        final ChatsResponseEntity entity =
            model.copyWith(chats: chats).toEntity();

        return Right(entity);
      },
    );
  }

  @override
  Future<Either<Failure, ChatsResponseEntity>> fetchChats() async {
    final response = await remoteProvider.fetchChats();

    return response.fold(
      (failure) async => getSavedChats(),
      (model) async {
        await localProvider.rewriteSavedChats(model.chats);

        for (final chat in model.chats) {
          await participantsLocalProvider.rewriteChatParticipants(
            chatId: chat.id,
            participants: chat.participants,
          );

          await messagesLocalProvider.rewriteMessages(
            chatId: chat.id,
            messages: chat.messages,
          );
        }

        final ChatsResponseEntity entity = model.toEntity();

        return Right(entity);
      },
    );
  }

  @override
  Future<Either<Failure, ChatEntity>> joinChat(
    JoinChatParams params,
  ) async {
    final response = await remoteProvider.joinChat(params);

    return response.fold(
      // ignore: unnecessary_lambdas
      (failure) => Left(failure),
      (model) async {
        await localProvider.cacheChat(model);

        await participantsLocalProvider.rewriteChatParticipants(
          chatId: model.id,
          participants: model.participants,
        );

        await messagesLocalProvider.rewriteMessages(
          chatId: model.id,
          messages: model.messages,
        );

        final ChatEntity entity = model.toEntity();
        return Right(entity);
      },
    );
  }

  @override
  Future<Either<Failure, void>> leaveChat(
    LeaveChatParams params,
  ) async {
    final response = await remoteProvider.leaveChat(params);

    return response.fold(
      // ignore: unnecessary_lambdas
      (failure) => Left(failure),
      (_) async {
        await localProvider.deleteChat(params.chatId);

        await participantsLocalProvider.rewriteChatParticipants(
          chatId: params.chatId,
          participants: [],
        );

        await messagesLocalProvider.rewriteMessages(
          chatId: params.chatId,
          messages: [],
        );

        return const Right(null);
      },
    );
  }

  @override
  Future<Either<Failure, MessageEntity>> sendMessage(
    SendMessageParams params,
  ) async {
    final response = await messagesRemoteProvider.sendMessage(params);

    return response.fold(
      // ignore: unnecessary_lambdas
      (failure) => Left(failure),
      (model) async {
        await messagesLocalProvider.cacheMessage(model: model);

        final MessageEntity entity = model.toEntity();
        return Right(entity);
      },
    );
  }

  @override
  Future<Either<Failure, void>> deleteAllChats() async {
    try {
      await localProvider.deleteAllChats();
      await participantsLocalProvider.deleteAllParticipants();
      await messagesLocalProvider.deleteAllMessages();

      return const Right(null);
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Error: $e \nStack trace:\n $stackTrace');
      }

      const cacheFailure = CacheFailure(
        errorMessage: 'Could not delete saved chats.',
      );

      return const Left(cacheFailure);
    }
  }

  @override
  Future<Either<Failure, ChatsResponseEntity>> searchChats(
    SearchChatsParams params,
  ) async {
    final response = await remoteProvider.searchChats(params);

    return response.fold(
      // ignore: unnecessary_lambdas
      (failure) => Left(failure),
      (model) {
        final ChatsResponseEntity entity = model.toEntity();

        return Right(entity);
      },
    );
  }
}
