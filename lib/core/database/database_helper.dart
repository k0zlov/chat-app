import 'package:chat_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

/// Defines an interface for database operations within the application.
///
/// This interface abstracts the underlying database implementation and provides
/// a contract for common database operations such as retrieval, insertion,
/// updating, and deletion of data. Implementations must handle these operations
/// and potentially encapsulate error handling using the `Either` type from `dartz`,
/// providing a unified approach to error management across database interactions.
abstract interface class DatabaseHelper {
  /// Retrieves data from a specified table within the database.
  ///
  /// This method should query the database based on the provided parameters and
  /// return the result as a parsed model of type [T]. In case of failure, it returns
  /// a [Failure] object encapsulated in an [Either]. This approach allows for expressive
  /// error handling while maintaining the type safety of successful operations.
  ///
  /// - [tableName] specifies the table from which to fetch the contacts.
  /// - [parser] is a function that converts raw database contacts into an instance of [T].
  /// - [where] and [whereArgs] allow specifying conditional clauses for the query.
  Future<Either<Failure, T>> get<T>({
    required String tableName,
    required T Function(Map<String, dynamic> json) parser,
    String? where,
    List<dynamic>? whereArgs,
  });

  Future<Either<Failure, void>> insert({
    required String tableName,
    required Map<String, dynamic> data,
  });

  Future<Either<Failure, void>> update({
    required String tableName,
    required Map<String, dynamic> data,
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
  Future<Either<Failure, void>> delete({
    required String tableName,
    List<dynamic>? whereArgs,
    String? where,
  });
}
