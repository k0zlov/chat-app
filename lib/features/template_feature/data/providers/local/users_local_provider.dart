import 'package:chat_app/core/database/database_handler.dart';
import 'package:chat_app/core/database/tables.dart';
import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/features/template_feature/data/models/user_model/user_model.dart';
import 'package:dartz/dartz.dart';

/// An interface defining operations for managing users' data in local storage.
///
/// Specifies methods for retrieving, caching, updating, and deleting user data.
abstract interface class UsersLocalProvider {
  /// Fetches a list of cached users.
  ///
  /// Returns a `Future` that completes with an `Either` containing a `Failure` on the left side,
  /// or a `UserResponse` on the right side, representing the list of users.
  Future<Either<Failure, UserResponse>> getCachedUsers();

  /// Caches a user's data.
  ///
  /// Takes a `UserModel` representing the user's data to be cached.
  Future<void> cacheUser({required UserModel userModel});

  /// Updates a cached user's data.
  ///
  /// Takes a `UserModel` representing the updated user's data.
  Future<void> updateCachedUser({required UserModel userModel});

  /// Deletes a user's data from cache.
  ///
  /// Takes a `UserModel` representing the user's data to be deleted.
  Future<void> deleteCachedUser({required UserModel userModel});
}

/// Implementation of [UsersLocalProvider] using a local database.
///
/// Utilizes a [DatabaseHandler] for database operations to manage user data,
/// including retrieval, caching, updating, and deletion.
class UsersLocalProviderImpl implements UsersLocalProvider {
  /// Constructs an instance of [UsersLocalProviderImpl] with a given [DatabaseHandler].
  ///
  /// The [DatabaseHandler] is used for all database interactions within this provider.
  UsersLocalProviderImpl({
    required this.databaseHandler,
  });

  /// The database handler used for performing operations on the users table.
  final DatabaseHandler databaseHandler;

  /// The name of the table in the database used for storing users' data.
  final String tableName = UsersTable().tableName;

  @override
  Future<Either<Failure, UserResponse>> getCachedUsers() async {
    // Retrieves users data from the local database.
    final response = await databaseHandler.get(
      tableName: tableName,
      parser: UserResponse.fromJson,
    );
    return response;
  }

  @override
  Future<void> cacheUser({required UserModel userModel}) async {
    // Caches a new user's data in the local database.
    await databaseHandler.insert(
      tableName: tableName,
      data: userModel,
      parser: (model) => model.toJson(),
    );
  }

  @override
  Future<void> updateCachedUser({required UserModel userModel}) async {
    // Updates an existing user's data in the local database.
    await databaseHandler.update(
      tableName: tableName,
      data: userModel,
      parser: (model) => model.toJson(),
      where: 'userid = ?',
      whereArgs: [userModel.userid],
    );
  }

  @override
  Future<void> deleteCachedUser({required UserModel userModel}) async {
    // Deletes a user's data from the local database.
    await databaseHandler.delete(
      tableName: tableName,
      where: 'userid = ?',
      whereArgs: [userModel.userid],
    );
  }
}
