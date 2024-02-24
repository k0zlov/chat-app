import 'package:chat_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

/// Abstract interface class for network operations.
abstract interface class Network {
  /// Retrieves data from the database.
  ///
  /// [tableName]: The name of the table from which to retrieve the data.
  ///
  /// [params]: Query parameters, such as conditions or sorting.
  ///
  /// [parser]: A function that converts data
  /// from a Map<String, dynamic> format to an object of type T.
  ///
  /// [filterColumn]: Optional column name for the filter clause.
  ///
  /// [filterValue]: Optional value of column for the filter clause.
  ///
  /// [filterOperator]: (Optional) The filter operator to use.
  /// Defaults to 'eq' (equals).
  /// Other possible values include 'gt' (greater than), 'lt' (less than), etc.
  ///
  /// Returns a list of objects of type T.
  Future<Either<Failure, T>> get<T>({
    required String tableName,
    required T Function(Map<String, dynamic> json) parser,
    String? filterColumn,
    String filterOperator = 'eq',
    Object? filterValue,
  });


  /// Sends data to the database.
  ///
  /// [tableName]: The name of the table to which to send the data.
  ///
  /// [data]: Th data to insert into the table.
  ///
  /// [parser]: A function that converts an object of type T
  /// to a Map<String, dynamic> for insertion into the database.
  ///
  /// Does not return any data.
  Future<void> post<T>({
    required String tableName,
    required T data,
    required Map<String, dynamic> Function(T) parser,
  });
}
