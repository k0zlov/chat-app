import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/features/chats/data/models/chat_model/chat_model.dart';
import 'package:chat_app/features/chats/data/providers/local/chat_participants_local_provider.dart';
import 'package:chat_app/features/chats/data/providers/local/chats_local_provider.dart';
import 'package:chat_app/features/chats/data/providers/remote/chats_remote_provider.dart';
import 'package:chat_app/features/chats/domain/entities/chats_response_entity/chats_response_entity.dart';
import 'package:chat_app/features/chats/domain/repositories/chats_repository.dart';
import 'package:chat_app/features/chats/domain/use_cases/create_chat_use_case/create_chat_use_case.dart';
import 'package:chat_app/features/chats/domain/use_cases/join_chat_use_case/join_chat_use_case.dart';
import 'package:chat_app/features/chats/domain/use_cases/leave_chat_use_case/leave_chat_use_case.dart';
import 'package:dartz/dartz.dart';

class ChatsRepositoryImpl implements ChatsRepository {
  const ChatsRepositoryImpl({
    required this.remoteProvider,
    required this.localProvider,
    required this.participantsLocalProvider,
  });

  final ChatsRemoteProvider remoteProvider;
  final ChatsLocalProvider localProvider;
  final ChatParticipantsLocalProvider participantsLocalProvider;

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
        final List<ChatModel> chatsWithParticipants = [];

        for (final ChatModel chat in model.chats) {
          final participantsResponse =
              await participantsLocalProvider.getSavedParticipants(
            chatId: chat.externalId,
          );

          participantsResponse.fold(
            (failure) => chatsWithParticipants.add(chat),
            (model) {
              chatsWithParticipants.add(
                chat.copyWith(participants: model.participants),
              );
            },
          );
        }

        final ChatsResponseEntity entity =
            model.copyWith(chats: chatsWithParticipants).toEntity();
        return Right(entity);
      },
    );
  }

  @override
  Future<Either<Failure, ChatsResponseEntity>> getUserChats() async {
    final response = await remoteProvider.fetchUserChats();

    return response.fold(
      (failure) async => getSavedChats(),
      (model) async {
        await localProvider.rewriteSavedChats(model.chats);

        for (final ChatModel chat in model.chats) {
          await participantsLocalProvider.rewriteChatParticipants(
            chatId: chat.externalId,
            participants: chat.participants,
          );
        }

        final ChatsResponseEntity entity = model.toEntity();
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
      (_) async => getUserChats(),
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
      (_) async => getUserChats(),
    );
  }
}
