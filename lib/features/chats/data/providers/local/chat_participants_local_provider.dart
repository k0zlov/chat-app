import 'package:chat_app/core/database/database_helper.dart';
import 'package:chat_app/core/database/tables.dart';
import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/features/chats/data/models/chat_participant_model/chat_participant_model.dart';
import 'package:chat_app/features/chats/data/models/chat_participants_response_model/chat_participants_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

abstract interface class ChatParticipantsLocalProvider {
  Future<Either<Failure, void>> cacheParticipant({
    required ChatParticipantModel model,
  });

  Future<Either<Failure, ChatParticipantsResponseModel>> getSavedParticipants({
    required int chatId,
  });

  Future<Either<Failure, void>> rewriteChatParticipants({
    required int chatId,
    required List<ChatParticipantModel> participants,
  });

  Future<void> deleteAllParticipants();
}

class ChatParticipantsLocalProviderImpl
    implements ChatParticipantsLocalProvider {
  const ChatParticipantsLocalProviderImpl({
    required this.database,
  });

  final DatabaseHelper database;

  String get tableName => ChatParticipantsTable().tableName;

  @override
  Future<Either<Failure, void>> cacheParticipant({
    required ChatParticipantModel model,
  }) async {
    final response = await database.insert(
      tableName: tableName,
      data: model.toJson(),
    );

    return response;
  }

  @override
  Future<Either<Failure, ChatParticipantsResponseModel>> getSavedParticipants({
    required int chatId,
  }) async {
    final response = await database.get(
      tableName: tableName,
      where: 'chatId = ?',
      whereArgs: [chatId],
      parser: ChatParticipantsResponseModel.fromJson,
    );
    return response;
  }

  @override
  Future<Either<Failure, void>> rewriteChatParticipants({
    required int chatId,
    required List<ChatParticipantModel> participants,
  }) async {
    try {
      await database.delete(
        where: 'chatId = ?',
        whereArgs: [chatId],
        tableName: tableName,
      );

      for (final ChatParticipantModel model in participants) {
        await cacheParticipant(model: model);
      }
      return const Right(null);
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Error: $e \nStack trace:\n $stackTrace');
      }

      const cacheFailure = CacheFailure(
        errorMessage: 'Could not rewrite saved chats.',
      );

      return const Left(cacheFailure);
    }
  }

  @override
  Future<void> deleteAllParticipants() async {
    await database.delete(tableName: tableName);
  }
}
