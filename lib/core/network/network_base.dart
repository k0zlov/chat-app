import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/network/network.dart';
import 'package:dartz/dartz.dart';

abstract class NetworkBase implements Network {
  Future<Either<Failure, T>> send<T>({
    required String url,
    required String method,
    required T Function(dynamic json) parser,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  });

  @override
  Future<Either<Failure, T>> get<T>({
    required String url,
    required T Function(dynamic json) parser,
    Map<String, dynamic>? queryParameters,
  }) async =>
      send(
        url: url,
        method: 'GET',
        parser: parser,
        queryParameters: queryParameters,
      );

  @override
  Future<Either<Failure, T>> post<T>({
    required String url,
    required T Function(dynamic json) parser,
    Map<String, dynamic>? data,
  }) async =>
      send(
        url: url,
        method: 'POST',
        parser: parser,
        data: data,
      );
}
