import 'package:chat_app/core/database/database_handler.dart';
import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/features/template_feature/data/models/message_model/message_model.dart';
import 'package:dartz/dartz.dart';

/// Interface for interacting with message-related data providers from a local database.
///
/// Implementations of this interface should provide methods to interact with
/// cached message data, such as fetching, caching, updating, and deleting messages.
abstract interface class MessagesLocalProvider {
  /// Fetches cached message data from the local database.
  ///
  /// Returns a [Future] that resolves to an [Either] containing either a
  /// [Failure] if the operation fails, or a [MessageResponse] if successful.
  Future<Either<Failure, MessageResponse>> getCachedMessages();

  /// Caches a new message entry into the local database.
  ///
  /// The [messageModel] parameter specifies the message to be cached.
  Future<void> cacheMessage({required MessageModel messageModel});

  /// Updates an existing cached message entry in the local database.
  ///
  /// The [messageModel] parameter specifies the updated message.
  Future<void> updateCachedMessage({required MessageModel messageModel});

  /// Deletes a cached message entry from the local database.
  ///
  /// The [messageModel] parameter specifies the message to be deleted.
  Future<void> deleteCachedMessage({required MessageModel messageModel});
}

/// Implementation of the [MessagesLocalProvider] interface using the provided [DatabaseHandler].
///
/// This implementation interacts with the local database layer
/// to perform message-related operations.
class MessagesLocalProviderImpl implements MessagesLocalProvider {

  /// Constructs a [MessagesLocalProviderImpl] instance with the specified [DatabaseHandler].
  const MessagesLocalProviderImpl({
    required this.databaseHandler,
  });
  /// The database handler used for performing database operations.
  final DatabaseHandler databaseHandler;

  @override
  Future<Either<Failure, MessageResponse>> getCachedMessages() async {
    final response = await databaseHandler.get(
      tableName: 'messages',
      parser: MessageResponse.fromJson,
    );

    return response;
  }

  @override
  Future<void> cacheMessage({required MessageModel messageModel}) async {
    await databaseHandler.insert(
      tableName: 'messages',
      data: messageModel,
      parser: (model) => model.toJson(),
    );
  }

  @override
  Future<void> updateCachedMessage({required MessageModel messageModel}) async {
    await databaseHandler.update(
      tableName: 'messages',
      data: messageModel,
      parser: (model) => model.toJson(),
      where: 'messageid = ?',
      whereArgs: [messageModel.messageid],
    );
  }

  @override
  Future<void> deleteCachedMessage({required MessageModel messageModel}) async {
    await databaseHandler.delete(
      tableName: 'messages',
      where: 'messageid = ?',
      whereArgs: [messageModel.messageid],
    );
  }
}
