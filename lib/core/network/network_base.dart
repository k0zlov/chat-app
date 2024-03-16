import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/network/network.dart';
import 'package:dartz/dartz.dart';

/// An abstract base class for network operations that implements the [Network] interface.
///
/// This class provides a unified way to handle network requests by implementing the
/// `get` and `post` methods from the [Network] interface and introducing a generic `send`
/// method that abstracts the common logic of network requests. It's intended to be
/// extended by concrete classes that can specify the actual logic for sending HTTP requests.
abstract class NetworkBase implements Network {
  /// Sends a network request.
  ///
  /// This is a generic method to send network requests, abstracting away the differences
  /// between request types like GET and POST. It should be implemented by subclasses to
  /// handle the actual network call, parsing the response using the provided parser function.
  ///
  /// Parameters:
  ///   [url] The endpoint URL for the request, appended to the base URL.
  ///   [method] The HTTP method (e.g., 'GET', 'POST').
  ///   [parser] A function to parse the JSON response into the desired type [T].
  ///   [queryParameters] (Optional) The query parameters for GET requests.
  ///   [data] (Optional) The data to be sent in the body of POST requests.
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

  /// Implements the `get` method from the [Network] interface.
  ///
  /// This method uses the `send` method to perform a GET request, passing the necessary
  /// parameters along with the 'GET' method type.
  @override
  Future<Either<Failure, T>> get<T>({
    required String url,
    required Map<String, dynamic> queryParameters,
    required T Function(dynamic json) parser,
  }) async =>
      send(
        url: url,
        method: 'GET',
        parser: parser,
        queryParameters: queryParameters,
      );

  /// Implements the `post` method from the [Network] interface.
  ///
  /// This method uses the `send` method to perform a POST request, passing the necessary
  /// parameters along with the 'POST' method type and the data to be sent in the request body.
  @override
  Future<Either<Failure, T>> post<T>({
    required String url,
    required Map<String, dynamic> data,
    required T Function(dynamic json) parser,
  }) async =>
      send(
        url: url,
        method: 'POST',
        parser: parser,
        data: data,
      );
}
