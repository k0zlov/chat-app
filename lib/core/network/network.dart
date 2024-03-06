import 'package:chat_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

/// Abstract interface class for network operations.
abstract interface class Network {
  static String? _baseUrl;

  static String? get baseUrl => _baseUrl;

  static set setBaseUrl(String url) => _baseUrl = url;

  Future<Either<Failure, T>> get<T>({
    required String url,
    required Map<String, dynamic> queryParameters,
    required T Function(dynamic json) parser,
  });

  Future<Either<Failure, T>> post<T>({
    required String url,
    required Map<String, dynamic> data,
    required T Function(dynamic json) parser,
  });
}
