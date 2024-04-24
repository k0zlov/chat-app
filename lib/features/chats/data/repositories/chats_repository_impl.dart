import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/features/chats/data/models/chat_model/chat_model.dart';
import 'package:chat_app/features/chats/data/providers/local/chat_participants_local_provider.dart';
import 'package:chat_app/features/chats/data/providers/local/chats_local_provider.dart';
import 'package:chat_app/features/chats/data/providers/local/messages_local_provider.dart';
import 'package:chat_app/features/chats/data/providers/remote/chats_remote_provider.dart';
import 'package:chat_app/features/chats/data/providers/remote/messages_remote_provider.dart';
import 'package:chat_app/features/chats/domain/entities/chats_response_entity/chats_response_entity.dart';
import 'package:chat_app/features/chats/domain/entities/message_entity/message_entity.dart';
import 'package:chat_app/features/chats/domain/repositories/chats_repository.dart';
import 'package:chat_app/features/chats/domain/use_cases/create_chat_use_case/create_chat_use_case.dart';
import 'package:chat_app/features/chats/domain/use_cases/join_chat_use_case/join_chat_use_case.dart';
import 'package:chat_app/features/chats/domain/use_cases/leave_chat_use_case/leave_chat_use_case.dart';
import 'package:chat_app/features/chats/domain/use_cases/send_message_use_case/send_message_use_case.dart';
import 'package:dartz/dartz.dart';

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
  Future<Either<Failure, ChatsResponseEntity>> createChat(
    CreateChatParams params,
  ) async {
    final response = await remoteProvider.createChat(params);

    return response.fold(
      // ignore: unnecessary_lambdas
      (failure) => Left(failure),
      (model) async {
        final JoinChatParams params = JoinChatParams(chatId: model.externalId);

        return joinChat(params);
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
          final participantsResponse =
              await participantsLocalProvider.getSavedParticipants(
            chatId: chat.externalId,
          );

          participantsResponse.fold(
            (failure) => null,
            (model) {
              chat = chat.copyWith(participants: model.participants);
            },
          );

          final messagesResponse = await messagesLocalProvider.getSavedMessages(
            chatId: chat.externalId,
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
    final response = await remoteProvider.fetchUserChats();

    return response.fold(
      (failure) async => getSavedChats(),
      (model) async {
        final List<ChatModel> chatsWithMessages = [];

        await localProvider.rewriteSavedChats(model.chats);

        for (final ChatModel chat in model.chats) {
          await participantsLocalProvider.rewriteChatParticipants(
            chatId: chat.externalId,
            participants: chat.participants,
          );

          final messagesResponse = await messagesRemoteProvider.getMessages(
            chat.externalId,
          );

          messagesResponse.fold(
            (failure) => chatsWithMessages.add(chat),
            (model) async {
              chatsWithMessages.add(
                chat.copyWith(messages: model.messages),
              );
              await messagesLocalProvider.rewriteMessages(
                chatId: chat.externalId,
                messages: model.messages,
              );
            },
          );
        }

        final ChatsResponseEntity entity =
            model.copyWith(chats: chatsWithMessages).toEntity();

        return Right(entity);
      },
    );
  }

  @override
  Future<Either<Failure, ChatsResponseEntity>> joinChat(
    JoinChatParams params,
  ) async {
    final response = await remoteProvider.joinChat(params);

    return response.fold(
      // ignore: unnecessary_lambdas
      (failure) => Left(failure),
      (_) async => fetchChats(),
    );
  }

  @override
  Future<Either<Failure, ChatsResponseEntity>> leaveChat(
    LeaveChatParams params,
  ) async {
    final response = await remoteProvider.leaveChat(params);

    return response.fold(
      // ignore: unnecessary_lambdas
      (failure) => Left(failure),
      (_) async => fetchChats(),
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
      (model) {
        final MessageEntity entity = model.toEntity();
        return Right(entity);
      },
    );
  }
}
