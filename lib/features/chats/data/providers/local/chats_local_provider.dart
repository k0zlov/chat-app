import 'package:chat_app/core/database/database_helper.dart';
import 'package:chat_app/core/database/tables.dart';
import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/features/chats/data/models/chat_model/chat_model.dart';
import 'package:chat_app/features/chats/data/models/chats_response_model/chats_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

abstract interface class ChatsLocalProvider {
  Future<Either<Failure, ChatsResponseModel>> getSavedChats();

  Future<Either<Failure, void>> cacheChat(ChatModel model);

  Future<Either<Failure, void>> deleteChat(int chatId);

  Future<Either<Failure, void>> rewriteSavedChats(
    List<ChatModel> chats,
  );

  Future<void> deleteAllChats();
}

class ChatsLocalProviderImpl implements ChatsLocalProvider {
  const ChatsLocalProviderImpl({
    required this.database,
  });

  final DatabaseHelper database;

  String get tableName => ChatsTable().tableName;

  @override
  Future<Either<Failure, void>> cacheChat(ChatModel model) async {
    final Map<String, dynamic> toSave = {
      ...model.toJson(),
      'isPinned': model.isPinned ? 1 : 0,
      'isArchived': model.isArchived ? 1 : 0,
    };

    final response = await database.insert(
      tableName: tableName,
      data: toSave
        ..remove('participants')
        ..remove('messages'),
    );
    return response;
  }

  @override
  Future<Either<Failure, void>> deleteChat(int chatId) async {
    final response = await database.delete(
      tableName: tableName,
      where: 'id = ?',
      whereArgs: [chatId],
    );

    return response;
  }

  @override
  Future<Either<Failure, ChatsResponseModel>> getSavedChats() async {
    final response = await database.get(
      tableName: tableName,
      parser: (data) {
        final items = data['items'] as List<Map<String, dynamic>>;

        final List<Map<String, dynamic>> parsedData = [];

        for (final Map<String, dynamic> rawChat in items) {
          final bool isArchived = rawChat['isArchived'] != 0;
          final bool isPinned = rawChat['isPinned'] != 0;

          parsedData.add({
            ...rawChat,
            'isPinned': isPinned,
            'isArchived': isArchived,
          });
        }

        return ChatsResponseModel.fromJson({'items': parsedData});
      },
    );

    return response;
  }

  @override
  Future<Either<Failure, void>> rewriteSavedChats(
    List<ChatModel> chats,
  ) async {
    try {
      await database.delete(tableName: tableName);
      for (final ChatModel model in chats) {
        await cacheChat(model);
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
  Future<void> deleteAllChats() async {
    await database.delete(tableName: tableName);
  }
}
