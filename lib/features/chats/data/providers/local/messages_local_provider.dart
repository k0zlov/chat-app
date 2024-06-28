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

  Future<Either<Failure, void>> deleteMessage({
    required int messageId,
  });

  Future<void> deleteAllMessages();
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
    final response = await database.insert(
      tableName: tableName,
      data: model.toJson(),
    );

    return response;
  }

  @override
  Future<Either<Failure, MessagesResponseModel>> getSavedMessages({
    required int chatId,
  }) async {
    final response = await database.get(
      tableName: tableName,
      where: 'chatId = ?',
      whereArgs: [chatId],
      parser: MessagesResponseModel.fromJson,
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
        where: 'chatId = ?',
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

  @override
  Future<void> deleteAllMessages() async {
    await database.delete(tableName: tableName);
  }

  @override
  Future<Either<Failure, void>> deleteMessage({
    required int messageId,
  }) async {
    final response = await database.delete(
      tableName: tableName,
      where: 'id = ?',
      whereArgs: [messageId],
    );

    return response;
  }
}
