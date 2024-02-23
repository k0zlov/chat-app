import 'dart:async';

import 'package:chat_app/core/network/network.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Implementation of the Network interface for network operations.
class NetworkImpl implements Network {
  /// Constructs a NetworkImpl instance with the provided SupabaseClient.
  ///
  /// [supabaseClient]: The SupabaseClient used for network operations.
  const NetworkImpl({
    required SupabaseClient supabaseClient,
  }) : _supabaseClient = supabaseClient;

  final SupabaseClient _supabaseClient;

  @override
  Future<List<T>> get<T>({
    required String tableName,
    required String params,
    required T Function(Map<String, dynamic>) parser,
    String? where,
    List<Object>? whereValues,
  }) async {
    final response = await _supabaseClient
        .from(tableName)
        .select(params)
        .inFilter(where ?? '', whereValues ?? []);

    return response.map((e) => parser(e)).toList();
  }

  @override
  Future<void> post<T>({
    required String tableName,
    required List<T> insertData,
    required Map<String, dynamic> Function(T) toJson,
  }) async {
    final jsonInsertData = insertData.map((e) => toJson(e)).toList();
    await _supabaseClient.from(tableName).insert(jsonInsertData);
  }
}
