import 'package:chat_app/core/database/database_helper.dart';
import 'package:chat_app/core/database/tables.dart';
import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/features/chats/data/models/message_model/message_model.dart';
import 'package:chat_app/features/chats/data/models/messages_response_model/messages_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

abstract interface class MessagesLocalProvider {
  Future<Either<Failure, void>> cacheMessage({
    required MessageModel model,
  });

  Future<Either<Failure, MessagesResponseModel>> getSavedMessages({
    required int chatId,
  });

  Future<Either<Failure, void>> rewriteMessages({
    required int chatId,
    required List<MessageModel> messages,
  });
}

class MessagesLocalProviderImpl implements MessagesLocalProvider {
  const MessagesLocalProviderImpl({
    required this.database,
  });

  final DatabaseHelper database;

  String get tableName => MessagesTable().tableName;

  @override
  Future<Either<Failure, void>> cacheMessage({
    required MessageModel model,
  }) async {
    final Map<String, dynamic> dataToSave = {
      'external_id': model.externalId,
      'chat_id': model.chatId,
      'user_id': model.userId,
      'content': model.content,
      'created_at': model.createdAt,
      'updated_at': model.updatedAt,
    };

    final response = await database.insert(
      tableName: tableName,
      data: dataToSave,
    );

    return response;
  }

  @override
  Future<Either<Failure, MessagesResponseModel>> getSavedMessages({
    required int chatId,
  }) async {
    final response = await database.get(
      tableName: tableName,
      where: 'chat_id = ?',
      whereArgs: [chatId],
      parser: (json) {
        final items = json['items'] as List<Map<String, dynamic>>;

        final List<MessageModel> messages = [];

        for (final Map<String, dynamic> rawMessage in items) {
          messages.add(
            MessageModel(
              externalId: rawMessage['external_id'] as int,
              userId: rawMessage['user_id'] as int,
              chatId: rawMessage['chat_id'] as int,
              content: rawMessage['content'] as String,
              createdAt: rawMessage['created_at'] as String,
              updatedAt: rawMessage['updated_at'] as String,
            ),
          );
        }

        return MessagesResponseModel(messages: messages);
      },
    );
    return response;
  }

  @override
  Future<Either<Failure, void>> rewriteMessages({
    required int chatId,
    required List<MessageModel> messages,
  }) async {
    try {
      await database.delete(
        where: 'chat_id = ?',
        whereArgs: [chatId],
        tableName: tableName,
      );
      for (final MessageModel model in messages) {
        await cacheMessage(model: model);
      }
      return const Right(null);
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Error: $e \nStack trace:\n $stackTrace');
      }

      const cacheFailure = CacheFailure(
        errorMessage: 'Could not rewrite saved messages.',
      );

      return const Left(cacheFailure);
    }
  }
}
