import 'package:chat_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

/// Defines the contract for network operations within the application.
///
/// This abstract class provides a template for implementing network requests,
/// including setting a base URL and performing GET and POST requests. It leverages
/// the Either type from the dartz package to handle the results and potential failures
/// of network operations, ensuring that failures are managed in a functional way.
abstract interface class Network {
  /// A static variable to hold the base URL for all network requests.
  static String? baseUrl;

  /// Performs a GET request.
  ///
  /// This method should be implemented to perform a GET request to the specified URL
  /// with the given query parameters. The response is parsed using the provided
  /// parser function, and the result is wrapped in an Either type to handle
  /// success and failure cases.
  ///
  /// Parameters:
  ///   [url] The endpoint URL for the GET request, appended to the base URL.
  ///   [queryParameters] The query parameters to be included in the GET request.
  ///   [parser] A function to parse the JSON response into the desired type [T].
  ///
  /// Returns:
  ///   A Future that resolves to an Either type, containing a [Failure] in case of
  ///   an error, or a [T] instance in case of success.
  Future<Either<Failure, T>> get<T>({
    required String url,
    required T Function(dynamic json) parser,
    Map<String, dynamic>? queryParameters,
  });

  /// Performs a POST request.
  ///
  /// This method should be implemented to perform a POST request to the specified URL
  /// with the given data. The response is parsed using the provided parser function,
  /// and the result is wrapped in an Either type to handle success and failure cases.
  ///
  /// Parameters:
  ///   [url] The endpoint URL for the POST request, appended to the base URL.
  ///   [data] The data to be sent in the body of the POST request.
  ///   [parser] A function to parse the JSON response into the desired type [T].
  ///
  /// Returns:
  ///   A Future that resolves to an Either type, containing a [Failure] in case of
  ///   an error, or a [T] instance in case of success.
  Future<Either<Failure, T>> post<T>({
    required String url,
    required T Function(dynamic json) parser,
    Map<String, dynamic>? data,
  });
}
