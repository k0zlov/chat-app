import 'package:chat_app/core/database/database_helper.dart';
import 'package:chat_app/core/database/tables.dart';
import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/features/chats/data/models/chat_model/chat_model.dart';
import 'package:chat_app/features/chats/data/models/chats_response_model/chats_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

abstract interface class ChatsLocalProvider {
  Future<Either<Failure, void>> rewriteSavedChats(List<ChatModel> chats);

  Future<Either<Failure, ChatsResponseModel>> getSavedChats();

  Future<Either<Failure, void>> cacheChat(ChatModel model);

  Future<Either<Failure, void>> deleteChat();
}

class ChatsLocalProviderImpl implements ChatsLocalProvider {
  const ChatsLocalProviderImpl({
    required this.database,
  });

  final DatabaseHelper database;

  String get tableName => ChatsTable().tableName;

  @override
  Future<Either<Failure, void>> cacheChat(ChatModel model) async {
    final Map<String, dynamic> dataToSave = {
      'external_id': model.externalId,
      'user_id': model.userId,
      'title': model.title,
      'description': model.description,
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
  Future<Either<Failure, void>> deleteChat() async {
    final response = await database.delete(
      tableName: tableName,
      where: 'external_id = ?',
      whereArgs: [],
    );
    return response;
  }

  @override
  Future<Either<Failure, ChatsResponseModel>> getSavedChats() async {
    final response = await database.get(
      tableName: tableName,
      parser: (json) {
        final items = json['items'] as List<Map<String, dynamic>>;

        final List<ChatModel> chats = [];

        for (final Map<String, dynamic> rawChat in items) {
          chats.add(
            ChatModel(
              title: rawChat['title'] as String,
              externalId: rawChat['external_id'] as int,
              userId: rawChat['user_id'] as int,
              description: rawChat['description'] as String,
              createdAt: rawChat['created_at'] as String,
              updatedAt: rawChat['updated_at'] as String,
            ),
          );
        }

        return ChatsResponseModel(chats: chats);
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
}
