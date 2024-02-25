import 'package:chat_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

/// Defines an interface for database operations within the application.
///
/// This interface abstracts the underlying database implementation and provides
/// a contract for common database operations such as retrieval, insertion,
/// updating, and deletion of data. Implementations must handle these operations
/// and potentially encapsulate error handling using the `Either` type from `dartz`,
/// providing a unified approach to error management across database interactions.
abstract interface class DatabaseHandler {
  /// Retrieves data from a specified table within the database.
  ///
  /// This method should query the database based on the provided parameters and
  /// return the result as a parsed model of type [T]. In case of failure, it returns
  /// a [Failure] object encapsulated in an [Either]. This approach allows for expressive
  /// error handling while maintaining the type safety of successful operations.
  ///
  /// - [tableName] specifies the table from which to fetch the data.
  /// - [parser] is a function that converts raw database data into an instance of [T].
  /// - [where] and [whereArgs] allow specifying conditional clauses for the query.
  Future<Either<Failure, T>> get<T>({
    required String tableName,
    required T Function(Map<String, dynamic> json) parser,
    String? where,
    List<dynamic>? whereArgs,
  });

  /// Inserts a new record into a specified table within the database.
  ///
  /// This operation should convert the provided [data] using the [parser] function into
  /// a format suitable for database insertion. Implementations should ensure that errors
  /// during the insertion process are handled gracefully, typically by logging or other
  /// error management strategies.
  ///
  /// - [tableName] specifies the target table for the insertion.
  /// - [data] is the data to be inserted, of type [T].
  /// - [parser] converts [data] into a map representation for insertion.
  Future<void> insert<T>({
    required String tableName,
    required T data,
    required Map<String, dynamic> Function(T data) parser,
  });

  /// Updates existing records in a specified table within the database.
  ///
  /// This method applies the provided [data] to records matching the [where] condition,
  /// using the [parser] function to convert [data] into a suitable format. Implementations
  /// should handle errors during the update process, ensuring the application's stability.
  ///
  /// - [tableName] specifies the target table for the update.
  /// - [data] is the new data for the update operation.
  /// - [parser] converts [data] into a map representation for updating.
  /// - [where] and [whereArgs] define the condition to select records for updating.
  Future<void> update<T>({
    required String tableName,
    required T data,
    required Map<String, dynamic> Function(T data) parser,
    required String where,
    required List<dynamic> whereArgs,
  });

  /// Deletes records from a specified table within the database.
  ///
  /// This method removes records that match the specified [where] condition. Implementations
  /// should ensure that errors during the deletion process are handled appropriately, maintaining
  /// the integrity and stability of the database.
  ///
  /// - [tableName] specifies the target table for deletion.
  /// - [where] and [whereArgs] define the condition to select records for deletion.
  Future<void> delete({
    required String tableName,
    required String where,
    required List<dynamic> whereArgs,
  });
}
