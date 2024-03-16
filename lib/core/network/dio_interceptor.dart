import 'package:chat_app/core/services/auth_service.dart';
import 'package:chat_app/di_container.dart';
import 'package:chat_app/features/auth/view/cubit/auth_cubit/auth_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioInterceptor extends Interceptor {
  const DioInterceptor({required this.authService});

  final AuthService authService;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final String? token = authService.getToken;
    options.headers.addAll({
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (token != null) ...{
        'Authorization': 'Bearer $token',
      },
    });
    return super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final Response<dynamic>? response = err.response;
    final dynamic data = response?.data;
    String? errorMessage;

    if (data is Map<String, dynamic> && data['message'] is String) {
      errorMessage = data['message'] as String;
    }

    final int? statusCode = response?.statusCode;

    if (statusCode == null) {
      errorMessage = 'Something went wrong.';
    }

    if (statusCode == 401) {
      errorMessage = 'Unauthorized. The request requires user authentication.';
      await getIt<AuthCubit>().logout();
    }

    if (statusCode == 402) {
      errorMessage = "Forbidden. You don't have permissions.";
    }

    if (statusCode == 404) {
      errorMessage = 'Not found.';
    }

    if (statusCode == 408) {
      errorMessage = 'Request Timeout. Please try again later.';
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
}
