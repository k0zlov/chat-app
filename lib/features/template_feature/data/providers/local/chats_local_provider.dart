import 'package:chat_app/core/database/database.dart';
import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/features/template_feature/data/models/chat_model/chat_model.dart';
import 'package:dartz/dartz.dart';

/// Interface for interacting with chat-related data providers from a local database.
///
/// Implementations of this interface should provide methods to interact with
/// cached chat data, such as fetching, caching, updating, and deleting chats.
abstract interface class ChatsLocalProvider {
  /// Fetches cached chat data from the local database.
  ///
  /// Returns a [Future] that resolves to an [Either] containing either a
  /// [Failure] if the operation fails, or a [ChatResponse] if successful.
  Future<Either<Failure, ChatResponse>> getCachedChats();

  /// Caches a new chat entry into the local database.
  ///
  /// The [chatModel] parameter specifies the chat to be cached.
  Future<void> cacheChat({required ChatModel chatModel});

  /// Updates an existing cached chat entry in the local database.
  ///
  /// The [chatModel] parameter specifies the updated chat.
  Future<void> updateCachedChat({required ChatModel chatModel});

  /// Deletes a cached chat entry from the local database.
  ///
  /// The [chatModel] parameter specifies the chat to be deleted.
  Future<void> deleteCachedChat({required ChatModel chatModel});
}

/// Implementation of the [ChatsLocalProvider] interface using the provided [DatabaseHandler].
///
/// This implementation interacts with the local database layer
/// to perform chat-related operations.
class ChatsLocalProviderImpl implements ChatsLocalProvider {

  /// Constructs a [ChatsLocalProviderImpl] instance with the specified [DatabaseHandler].
  const ChatsLocalProviderImpl({
    required this.databaseHandler,
  });
  /// The database handler used for performing database operations.
  final DatabaseHandler databaseHandler;

  @override
  Future<Either<Failure, ChatResponse>> getCachedChats() async {
    final response = await databaseHandler.get(
      tableName: 'chats',
      parser: ChatResponse.fromJson,
    );

    return response;
  }

  @override
  Future<void> cacheChat({required ChatModel chatModel}) async {
    await databaseHandler.insert(
      tableName: 'chats',
      data: chatModel,
      parser: (model) => model.toJson(),
    );
  }

  @override
  Future<void> updateCachedChat({required ChatModel chatModel}) async {
    await databaseHandler.update(
      tableName: 'chats',
      data: chatModel,
      parser: (model) => model.toJson(),
      where: 'chatid = ?',
      whereArgs: [chatModel.chatid],
    );
  }

  @override
  Future<void> deleteCachedChat({required ChatModel chatModel}) async {
    await databaseHandler.delete(
      tableName: 'chats',
      where: 'chatid = ?',
      whereArgs: [chatModel.chatid],
    );
  }
}
