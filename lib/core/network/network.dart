/// Abstract interface class for network operations.
abstract class Network {
  /// Retrieves data from the database.
  ///
  /// [tableName]: The name of the table from which to retrieve the data.
  ///
  /// [params]: Query parameters, such as conditions or sorting.
  ///
  /// [parser]: A function that converts data
  /// from a Map<String, dynamic> format to an object of type T.
  ///
  /// [where]: Optional column name for the WHERE clause.
  ///
  /// [whereValues]: Optional list of values for the WHERE clause.
  ///
  /// Returns a list of objects of type T.
  Future<List<T>> get<T>({
    required String tableName,
    required String params,
    required T Function(Map<String, dynamic>) parser,
    String? where,
    List<Object>? whereValues,
  });


  /// Sends data to the database.
  ///
  /// [tableName]: The name of the table to which to send the data.
  ///
  /// [insertData]: The list of data to insert into the table.
  ///
  /// [toJson]: A function that converts an object of type T
  /// to a Map<String, dynamic> for insertion into the database.
  ///
  /// Does not return any data.
  Future<void> post<T>({
    required String tableName,
    required List<T> insertData,
    required Map<String, dynamic> Function(T) toJson,
  });
}
