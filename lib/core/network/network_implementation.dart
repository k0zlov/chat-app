import 'dart:async';
import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/network/network.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Implementation of the Network interface for network operations.
class NetworkImpl implements Network {
  /// Constructs a NetworkImpl instance with the provided SupabaseClient.
  ///
  /// [supabaseClient]: The SupabaseClient used for network operations.
  NetworkImpl() {
    _init();
  }

  late SupabaseClient _supabaseClient;

  Future<void> _init() async {
    _supabaseClient = Supabase.instance.client;
  }

  @override
  Future<Either<Failure, T>> get<T>({
    required String tableName,
    required T Function(Map<String, dynamic> json) parser,
    String? filterColumn,
    String filterOperator = 'eq',
    Object? filterValue,
  }) async {
    try {
      final response = await _supabaseClient.from(tableName).select().filter(
            filterColumn ?? '',
            filterOperator,
            filterValue,
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
  Future<void> post<T>({
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
