import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/features/chats/domain/entities/chats_response_entity/chats_response_entity.dart';
import 'package:chat_app/features/chats/domain/use_cases/create_chat_use_case/create_chat_use_case.dart';
import 'package:chat_app/features/chats/domain/use_cases/join_chat_use_case/join_chat_use_case.dart';
import 'package:chat_app/features/chats/domain/use_cases/leave_chat_use_case/leave_chat_use_case.dart';
import 'package:dartz/dartz.dart';

abstract interface class ChatsRepository {
  Future<Either<Failure, ChatsResponseEntity>> getUserChats();

  Future<Either<Failure, ChatsResponseEntity>> getSavedChats();

  Future<Either<Failure, ChatsResponseEntity>> joinChat(
    JoinChatParams params,
  );

  Future<Either<Failure, ChatsResponseEntity>> leaveChat(
    LeaveChatParams params,
  );

  Future<Either<Failure, ChatsResponseEntity>> createChat(
    CreateChatParams params,
  );
}