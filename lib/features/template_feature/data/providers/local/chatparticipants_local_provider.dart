import 'package:chat_app/core/database/database_handler.dart';
import 'package:chat_app/core/database/tables.dart';
import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/features/template_feature/data/models/chat_participants_model/chat_participants_model.dart';
import 'package:dartz/dartz.dart';

/// An abstraction layer for local data operations related to chat participants.
///
/// This interface defines the operations that can be performed on the local
/// storage for chat participants, such as caching, updating, and deleting
/// chat participants data.
abstract interface class ChatParticipantsLocalProvider {
  /// Retrieves cached chat participants data.
  ///
  /// Returns a `Future` that resolves to an `Either` type containing a `Failure`
  /// on the left side or a `ChatParticipantsResponse` on the right side.
  Future<Either<Failure, ChatParticipantsResponse>> getCachedChatParticipants();

  /// Caches a chat participant's data.
  ///
  /// Requires a `ChatParticipantsModel` instance representing the participant's data to be cached.
  Future<void> cacheChatParticipant({
    required ChatParticipantsModel chatParticipantsModel,
  });

  /// Updates a cached chat participant's data.
  ///
  /// Requires a `ChatParticipantsModel` instance representing the updated data of the participant.
  Future<void> updateCachedChatParticipant({
    required ChatParticipantsModel chatParticipantsModel,
  });

  /// Deletes a cached chat participant's data.
  ///
  /// Requires a `ChatParticipantsModel` instance representing the participant's data to be deleted.
  Future<void> deleteCachedChatParticipant({
    required ChatParticipantsModel chatParticipantsModel,
  });
}

/// A concrete implementation of [ChatParticipantsLocalProvider] that uses a local database.
///
/// This class is responsible for performing operations such as retrieving, caching,
/// updating, and deleting chat participants data from the local database.
class ChatParticipantsLocalProviderImpl implements ChatParticipantsLocalProvider {
  /// Constructs a [ChatParticipantsLocalProviderImpl] with a required [DatabaseHelper].
  ///
  /// The [DatabaseHelper] is used to interact with the local database.
  ChatParticipantsLocalProviderImpl({
    required this.databaseHelper,
  });

  /// The [DatabaseHelper] used for database operations.
  final DatabaseHelper databaseHelper;

  /// The name of the table in the database used for storing chat participants data.
  final String tableName = ChatParticipantsTable().tableName;

  @override
  Future<Either<Failure, ChatParticipantsResponse>> getCachedChatParticipants() async {
    // Retrieve chat participants data from the local database.
    final response = await databaseHelper.get(
      tableName: tableName,
      parser: ChatParticipantsResponse.fromJson,
    );
    return response;
  }

  @override
  Future<void> cacheChatParticipant({
    required ChatParticipantsModel chatParticipantsModel,
  }) async {
    // Insert a new chat participant's data into the local database.
    await databaseHelper.insert(
      tableName: tableName,
      data: chatParticipantsModel,
      parser: (model) => model.toJson(),
    );
  }

  @override
  Future<void> updateCachedChatParticipant({
    required ChatParticipantsModel chatParticipantsModel,
  }) async {
    // Update an existing chat participant's data in the local database.
    await databaseHelper.update(
      tableName: tableName,
      data: chatParticipantsModel,
      parser: (model) => model.toJson(),
      where: 'userid = ? AND chatid = ?',
      whereArgs: [chatParticipantsModel.userId, chatParticipantsModel.chatId],
    );
  }

  @override
  Future<void> deleteCachedChatParticipant({
    required ChatParticipantsModel chatParticipantsModel,
  }) async {
    // Delete a chat participant's data from the local database.
    await databaseHelper.delete(
      tableName: tableName,
      where: 'userid = ? AND chatid = ?',
      whereArgs: [chatParticipantsModel.userId, chatParticipantsModel.chatId],
    );
  }
}
