import 'package:chat_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

/// An interface for handling interactions with a Supabase database.
///
/// Provides a layer of abstraction for performing common database operations
/// such as retrieving and inserting data, allowing for a more flexible and
/// decoupled implementation. This interface is designed to be implemented by
/// classes that interact with Supabase, encapsulating the specifics of API
/// calls and data handling.
abstract interface class SupabaseHandler {

  /// Retrieves data from a specified table in the Supabase database.
  ///
  /// This method performs a query to fetch data from the given [tableName],
  /// optionally applying filters, ordering, and limiting the results. It returns
  /// a [Future] that resolves to an [Either] type, encapsulating a [Failure]
  /// or the successfully retrieved data of type [T].
  ///
  ///   - [tableName] : The name of the table to query data from.
  ///   - [parser] : A function to convert the JSON map into an instance of [T].
  ///   - [orderColumn] : (Optional) The column name to sort the results by.
  ///   - [filterColumn] :  (Optional) The column name to apply the filter on.
  ///   - [filterValue] : (Optional) The value to filter the results by.
  ///   - [limit] : The maximum number of results to return (default is 1000).
  ///   - [filterOperator] : The operator to use for filtering (default is 'eq').
  ///   - [isAscendingOrder] : Determines the sort order of the results (default is false for descending).
  ///
  /// Returns:
  /// A `Future<Either<Failure, T>>` that completes with a `Failure` if an error occurs,
  /// or the retrieved data of type `T` on success.
  Future<Either<Failure, T>> retrieve<T>({
    required String tableName,
    required T Function(Map<String, dynamic> json) parser,
    String? orderColumn,
    String? filterColumn,
    Object? filterValue,
    int limit = 1000,
    String filterOperator = 'eq',
    bool isAscendingOrder = false,
  });

  /// Inserts data into a specified table in the Supabase database.
  ///
  /// Takes a generic data of type [T] and inserts it into the specified [tableName]
  /// after converting it into a JSON map using the provided [parser]. This method
  /// does not return any value but completes with an error if the insertion fails.
  ///
  /// Parameters:
  ///   - [tableName] : The name of the table to insert data into.
  ///   - [data] : The data of type [T] to be inserted.
  ///   - [parser] : A function that converts [T] into a JSON map for insertion.
  ///
  /// Usage:
  /// This method is intended to be called with the necessary parameters to insert
  /// data into the corresponding Supabase table, handling any necessary data
  /// transformation internally.
  Future<void> insert<T>({
    required String tableName,
    required T data,
    required Map<String, dynamic> Function(T) parser,
  });
}
