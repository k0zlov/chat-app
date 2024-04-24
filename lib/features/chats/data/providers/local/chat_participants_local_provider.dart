import 'package:chat_app/core/database/database_helper.dart';
import 'package:chat_app/core/database/tables.dart';
import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/features/chats/data/models/chat_participant_model/chat_participant_model.dart';
import 'package:chat_app/features/chats/data/models/chat_participants_response_model/chat_participants_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

abstract interface class ChatParticipantsLocalProvider {
  Future<Either<Failure, void>> cacheParticipant({
    required int chatId,
    required ChatParticipantModel model,
  });

  Future<Either<Failure, ChatParticipantsResponseModel>> getSavedParticipants({
    required int chatId,
  });

  Future<Either<Failure, void>> rewriteChatParticipants({
    required int chatId,
    required List<ChatParticipantModel> participants,
  });
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
    required int chatId,
    required ChatParticipantModel model,
  }) async {
    final Map<String, dynamic> dataToSave = {
      'external_id': model.externalId,
      'chat_id': chatId,
      'user_id': model.userId,
      'created_at': model.createdAt,
    };

    final response = await database.insert(
      tableName: tableName,
      data: dataToSave,
    );

    return response;
  }

  @override
  Future<Either<Failure, ChatParticipantsResponseModel>> getSavedParticipants({
    required int chatId,
  }) async {
    final response = await database.get(
      tableName: tableName,
      where: 'chat_id = ?',
      whereArgs: [chatId],
      parser: (json) {
        final items = json['items'] as List<Map<String, dynamic>>;

        final List<ChatParticipantModel> participants = [];

        for (final Map<String, dynamic> rawParticipant in items) {
          participants.add(
            ChatParticipantModel(
              externalId: rawParticipant['external_id'] as int,
              userId: rawParticipant['user_id'] as int,
              createdAt: rawParticipant['created_at'] as String,
            ),
          );
        }

        return ChatParticipantsResponseModel(participants: participants);
      },
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
        where: 'chat_id = ?',
        whereArgs: [chatId],
        tableName: tableName,
      );
      for (final ChatParticipantModel model in participants) {
        await cacheParticipant(chatId: chatId, model: model);
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
}
