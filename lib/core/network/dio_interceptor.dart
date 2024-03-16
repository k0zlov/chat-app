import 'package:chat_app/core/network/api_endpoints.dart';
import 'package:chat_app/core/network/network.dart';
import 'package:chat_app/core/services/auth_service.dart';
import 'package:chat_app/utils/cookies/get_cookies.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Intercepts HTTP requests and responses to add authorization headers and handle errors.
class DioInterceptor extends Interceptor {
  /// Constructs a `DioInterceptor` with a dependency on [AuthService] for token management.
  const DioInterceptor({required this.authService});

  /// The authentication service used to retrieve the current user's token.
  final AuthService authService;

  /// Generates HTTP headers for requests, including authorization if a token exists.
  Map<String, String> get generateHeaders {
    final String? accessToken = authService.getAccessToken;
    final String? refreshToken = authService.getRefreshToken;

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (accessToken != null) ...{
        'Authorization': 'Bearer $accessToken',
      },
      if (refreshToken != null) ...{
        'Cookie': 'refreshToken=$refreshToken',
      },
    };

    return headers;
  }

  /// Configures and returns a Dio instance with base URL and default headers.
  Dio get dio {
    final dio = Dio(
      BaseOptions(
        baseUrl: Network.baseUrl!,
        headers: generateHeaders,
      ),
    );
    return dio;
  }

  /// Intercepts outgoing requests to add common headers and authorization token.
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final Map<String, String> headers = generateHeaders;

    options.headers.addAll(headers);

    return super.onRequest(options, handler);
  }

  /// Intercepts errors to perform custom error handling and token refreshing.
  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    String? errorMessage;
    final int? statusCode = err.response?.statusCode;

    switch (statusCode) {
      case 400:
        {
          errorMessage = _getMessageFromServer(err) ?? 'Bad response';
          break;
        }

      case 401:
        {
          try {
            await refreshToken();
            handler.resolve(await _retry(err.requestOptions));
            return;
          } on DioException {
            await authService.logout();
            errorMessage = 'Error while refreshing access token.';
          }
          break;
        }

      case 403:
        {
          errorMessage =
              "Forbidden. You don't have access the requested resource";
          break;
        }

      case 404:
        {
          errorMessage = 'Not found';
          break;
        }

      case 500:
        {
          errorMessage = 'Internal Server Error';
          break;
        }

      case 503:
        {
          errorMessage = 'Service Unavailable';
          break;
        }
    }

    final DioException specificErr = err.copyWith(
      message: errorMessage ?? 'An error occurred.',
    );

    if (kDebugMode) {
      print('Error: $specificErr\nStack trace:');
      debugPrintStack(stackTrace: specificErr.stackTrace);
    }

    handler.next(specificErr);
  }

  /// Attempts to refresh the user's authentication token.
  Future<void> refreshToken() async {
    final String? refreshToken = authService.getRefreshToken;

    if (refreshToken == null) return;

    final Response<Map<String, dynamic>> response = await dio.get(
      APIEndpoints.getRefreshToken,
      queryParameters: {},
    );

    if (response.statusCode != 200) return;


    final String? newAccessToken = response.data?['accessToken'] as String?;

    if (newAccessToken == null) return;

    final String? rawCookies = response.headers.value('set-cookie');

    final Map<String, String> cookies = getCookiesFromRaw(rawCookies ?? '');

    final String? newRefreshToken = cookies['refreshToken'];

    if(newRefreshToken == null) return;

    await authService.login(
      accessToken: newAccessToken,
      refreshToken: newRefreshToken,
    );
  }

  /// Retries an HTTP request with the given [requestOptions].
  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
    );

    final Response<dynamic> response = await dio.request(
      requestOptions.path,
      options: options,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
    );

    return response;
  }

  /// Extracts a user-friendly error message from the server's response.
  String? _getMessageFromServer(DioException error) {
    final Response<dynamic>? response = error.response;
    final dynamic data = response?.data;
    String? errorMessage;

    if (data is Map<String, dynamic> && data['message'] is String) {
      errorMessage = data['message'] as String;
    }

    return errorMessage;
  }
}
