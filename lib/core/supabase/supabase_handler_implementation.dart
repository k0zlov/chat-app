import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/supabase/supabase_handler.dart';
import 'package:chat_app/di_container.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// A concrete implementation of the `SupabaseHandler` interface, utilizing
/// the Supabase Flutter client to facilitate database operations such as
/// data retrieval and insertion within Flutter applications.
///
/// This class abstracts the complexity of direct Supabase API interactions
/// and integrates error handling to enhance developer experience and
/// application robustness.
class SupabaseHandlerImpl implements SupabaseHandler {
  /// Instantiates a `SupabaseHandlerImpl` and initiates the setup of the
  /// Supabase client.
  ///
  /// During construction, the `_init` method is invoked to configure the
  /// Supabase client with necessary parameters, ensuring it is ready for
  /// subsequent database operations. This setup process includes specifying
  /// the Supabase project URL and authentication key, which are essential for
  /// secure and effective communication with the Supabase backend.
  SupabaseHandlerImpl() {
    _init();
  }

  /// The Supabase client used for database operations.
  ///
  /// This client is initialized in the [_init] method and is used to perform
  /// all Supabase-related operations within this class.
  late SupabaseClient _supabaseClient;

  /// Initializes the Supabase client.
  ///
  /// This method sets up the Supabase client by accessing the singleton instance
  /// provided by the Supabase Flutter package. It ensures the client is ready
  /// to be used for database operations.
  Future<void> _init() async {
    // Supabase configuration constants.
    const supabaseUrl = 'https://pyjduiurropblpsqzgzs.supabase.co';
    const supabaseKey = String.fromEnvironment('SUPABASE_KEY');

    // Initializes Supabase client with the provided URL and anonKey.
    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseKey,
    );

    _supabaseClient = Supabase.instance.client;
    getIt.signalReady(this);
  }

  @override
  Future<Either<Failure, T>> retrieve<T>({
    required String tableName,
    required T Function(Map<String, dynamic> json) parser,
    String? orderColumn,
    String? filterColumn,
    Object? filterValue,
    int limit = 1000,
    String filterOperator = 'eq',
    bool isAscendingOrder = false,
  }) async {
    try {
      final query = _supabaseClient
          .from(tableName)
          .select()
          .filter(filterColumn ?? '', filterOperator, filterValue)
          .limit(limit);

      final response = orderColumn == null
          ? await query
          : await query.order(
        orderColumn,
        ascending: isAscendingOrder,
      );

      final parsedResponse = parser({'items': response});

      return Right(parsedResponse);
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Error: $e \nStack trace:\n $stackTrace');
      }

      const serverFailure = ServerFailure(
        errorMessage: 'Could not retrieve data from database',
      );

      return const Left(serverFailure);
    }
  }

  @override
  Future<void> insert<T>({
    required String tableName,
    required T data,
    required Map<String, dynamic> Function(T) parser,
  }) async {
    try {
      final parsedData = parser(data);
      await _supabaseClient.from(tableName).insert(parsedData);
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Error: $e \nStack trace:\n $stackTrace');
      }
    }
  }
}
