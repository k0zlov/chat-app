import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/features/chats/domain/entities/chat_entity/chat_entity.dart';
import 'package:chat_app/features/chats/domain/entities/chats_response_entity/chats_response_entity.dart';
import 'package:chat_app/features/chats/domain/entities/message_entity/message_entity.dart';
import 'package:chat_app/features/chats/domain/use_cases/archive_chat_use_case/archive_chat_use_case.dart';
import 'package:chat_app/features/chats/domain/use_cases/create_chat_use_case/create_chat_use_case.dart';
import 'package:chat_app/features/chats/domain/use_cases/join_chat_use_case/join_chat_use_case.dart';
import 'package:chat_app/features/chats/domain/use_cases/leave_chat_use_case/leave_chat_use_case.dart';
import 'package:chat_app/features/chats/domain/use_cases/pin_chat_use_case/pin_chat_use_case.dart';
import 'package:chat_app/features/chats/domain/use_cases/search_chats_use_case/search_chats_use_case.dart';
import 'package:chat_app/features/chats/domain/use_cases/send_message_use_case/send_message_use_case.dart';
import 'package:dartz/dartz.dart';

abstract interface class ChatsRepository {
  Future<Either<Failure, ChatsResponseEntity>> fetchChats();

  Future<Either<Failure, ChatsResponseEntity>> getSavedChats();

  Future<Either<Failure, void>> eraseAllChats();

  Future<Either<Failure, ChatEntity>> joinChat(
    JoinChatParams params,
  );

  Future<Either<Failure, void>> leaveChat(
    LeaveChatParams params,
  );

  Future<Either<Failure, ChatEntity>> createChat(
    CreateChatParams params,
  );

  Future<Either<Failure, MessageEntity>> sendMessage(
    SendMessageParams params,
  );

  Future<Either<Failure, ChatsResponseEntity>> searchChats(
    SearchChatsParams params,
  );

  Future<Either<Failure, ChatEntity>> updatePinChat(
    PinChatParams params,
  );

  Future<Either<Failure, ChatEntity>> updateArchiveChat(
    ArchiveChatParams params,
  );
}
