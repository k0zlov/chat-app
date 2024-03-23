import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/network/dio_interceptor.dart';
import 'package:chat_app/core/network/network.dart';
import 'package:chat_app/core/network/network_base.dart';
import 'package:chat_app/utils/cookies/get_cookies.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

/// A concrete implementation of [NetworkBase] using the Dio package for HTTP requests.
///
/// This class initializes Dio with a base URL and a custom interceptor for
/// additional request/response processing. The [send] method is overridden to
/// perform network requests using Dio, handling responses and errors.
class NetworkImplDio extends NetworkBase {
  /// Constructs a [NetworkImplDio] instance with a base URL and a Dio interceptor.
  ///
  /// The base URL is set for the entire application's network requests, and the
  /// interceptor can be used for logging, authentication, etc.
  ///
  /// Parameters:
  ///   [baseUrl] The base URL for all network requests made through Dio.
  ///   [interceptor] A [DioInterceptor] instance for intercepting requests/responses.
  NetworkImplDio({
    required String baseUrl,
    required this.interceptor,
  }) {
    Network.baseUrl = baseUrl; // Set the base URL in the Network class.
  }

  /// The Dio interceptor used for request/response manipulation.
  final DioInterceptor interceptor;

  /// Configures and returns a Dio instance with the base URL and interceptor.
  ///
  /// The base URL is fetched from the [Network] class, and the interceptor is
  /// added to Dio's list of interceptors for processing all network requests.
  Dio get dio {
    final dio = Dio(
      BaseOptions(baseUrl: Network.baseUrl!),
    ); // Initialize Dio with the base URL.

    dio.interceptors.add(interceptor); // Add the custom interceptor.

    return dio; // Return the configured Dio instance.
  }

  /// Overrides the [send] method from [NetworkBase] to perform requests using Dio.
  ///
  /// This method constructs Dio requests based on the provided parameters and handles
  /// the network response or any exceptions that occur during the request.
  ///
  /// Parameters:
  ///   [url] The endpoint URL for the network request.
  ///   [method] The HTTP method (e.g., 'GET', 'POST').
  ///   [parser] A function to parse the response JSON into the desired type [T].
  ///   [queryParameters] (Optional) Query parameters for the request.
  ///   [data] (Optional) Data to be sent in the request body for POST requests.
  ///
  /// Returns:
  ///   A Future that resolves to an Either type, containing a [Failure] on error,
  ///   or the parsed response data [T] on success.
  @override
  Future<Either<Failure, T>> send<T>({
    required String url,
    required String method,
    required T Function(dynamic json) parser,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) async {
    try {
      // Set the request method in options.
      final Options options = Options(method: method);

      final Response<dynamic> response = await dio.request(
        url,
        options: options,
        data: data,
        queryParameters: queryParameters,
      ); // Perform the Dio request.

      final String? rawCookies = response.headers.value('set-cookie');

      final Map<String, String> cookies = getCookiesFromRaw(rawCookies ?? '');

      dynamic responseData = response.data;

      if (responseData is Map<String, dynamic>) {
        responseData = {
          ...cookies,
          ...response.data as Map<String, dynamic>,
        };
      }

      final T parsedData = parser(responseData); // Parse the response data.

      return Right(parsedData); // Return success with parsed data.
    } on DioException catch (e) {
      // Handle Dio-specific exceptions and wrap in a Failure.
      final serverFailure = ServerFailure(
        errorMessage: e.message ?? 'An error occurred.',
      );

      return Left(serverFailure); // Return failure.
    }
  }
}
