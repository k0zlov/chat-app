import 'package:chat_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

/// Interface for interacting with a database handler for performing database operations.
///
/// Implementations of this interface should provide methods to perform common database operations
/// such as fetching, inserting, updating, and deleting data from a database.
abstract interface class DatabaseHandler {
  /// Fetches data from the specified table in the database.
  ///
  /// Returns a [Future] that resolves to an [Either] containing either a
  /// [Failure] if the operation fails, or a value of type [T] if successful.
  Future<Either<Failure, T>> get<T>({
    required String tableName,
    required T Function(Map<String, dynamic> json) parser,
    String? where,
    List<dynamic>? whereArgs,
  });

  /// Inserts data into the specified table in the database.
  ///
  /// The [data] parameter specifies the data to be inserted, and the [parser] function
  /// is used to convert the data into a format suitable for insertion into the database.
  Future<void> insert<T>({
    required String tableName,
    required T data,
    required Map<String, dynamic> Function(T data) parser,
  });

  /// Updates data in the specified table in the database.
  ///
  /// The [data] parameter specifies the updated data, and the [parser] function
  /// is used to convert the data into a format suitable for updating in the database.
  Future<void> update<T>({
    required String tableName,
    required T data,
    required Map<String, dynamic> Function(T data) parser,
    required String where,
    required List<dynamic> whereArgs,
  });

  /// Deletes data from the specified table in the database.
  ///
  /// The [where] parameter specifies the condition for deletion,
  /// and the [whereArgs] parameter provides values to substitute in the condition.
  Future<void> delete({
    required String tableName,
    required String where,
    required List<dynamic> whereArgs,
  });
}
