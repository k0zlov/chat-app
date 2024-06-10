import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/network/network.dart';
import 'package:dartz/dartz.dart';

/// An abstract base class for network operations.
///
/// This class provides a generic implementation for sending network requests,
/// allowing derived classes to specify the details of how requests are sent and
/// responses are handled. It implements the `Network` interface, ensuring that
/// common network operations (GET, POST, DELETE) are available and can be customized
/// by subclasses.
abstract class NetworkBase implements Network {
  /// Sends a network request.
  ///
  /// This method is a generic implementation for sending network requests of various types
  /// (GET, POST, DELETE, etc.). It constructs the request based on the provided parameters
  /// and sends it using the specified HTTP method. The response is parsed using the provided
  /// parser function, and the result is wrapped in an Either type to handle success and failure
  /// cases.
  ///
  /// Parameters:
  ///   [url] The endpoint URL for the network request, appended to the base URL.
  ///   [method] The HTTP method to use for the request (e.g., 'GET', 'POST', 'DELETE').
  ///   [parser] A function to parse the JSON response into the desired type [T].
  ///   [queryParameters] The query parameters to be included in the network request.
  ///   [data] The data to be sent in the body of the request (if applicable).
  ///
  /// Returns:
  ///   A Future that resolves to an Either type, containing a [Failure] in case of
  ///   an error, or a [T] instance in case of success.
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
  }) =>
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
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) =>
      send(
        url: url,
        method: 'POST',
        parser: parser,
        data: data,
        queryParameters: queryParameters,
      );

  @override
  Future<Either<Failure, T>> delete<T>({
    required String url,
    required T Function(dynamic json) parser,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) =>
      send(
        url: url,
        method: 'DELETE',
        parser: parser,
        data: data,
        queryParameters: queryParameters,
      );

  @override
  Future<Either<Failure, T>> put<T>({
    required String url,
    required T Function(dynamic json) parser,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) =>
      send(
        url: url,
        method: 'PUT',
        parser: parser,
        data: data,
        queryParameters: queryParameters,
      );
}
