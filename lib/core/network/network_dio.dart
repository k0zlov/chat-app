import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/network/dio_interceptor.dart';
import 'package:chat_app/core/network/network.dart';
import 'package:chat_app/core/network/network_base.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class NetworkImplDio extends NetworkBase {
  /// fd
  NetworkImplDio({
    required String baseUrl,
    required this.interceptor,
  }) {
    Network.setBaseUrl = baseUrl;
  }

  final DioInterceptor interceptor;

  Dio get dio {
    final dio = Dio(BaseOptions(baseUrl: Network.baseUrl!));
    dio.interceptors.add(interceptor);

    return dio;
  }

  @override
  Future<Either<Failure, T>> send<T>({
    required String url,
    required String method,
    required T Function(dynamic json) parser,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) async {
    try {
      final Options options = Options(method: method);

      final Response<dynamic> response = await dio.request(
        url,
        options: options,
        data: data,
        queryParameters: queryParameters,
      );

      final T parsedData = parser(response);

      return Right(parsedData);
    } on DioException catch (e) {
      final serverFailure = ServerFailure(
        errorMessage: e.message ?? 'An error occurred.',
      );

      return Left(serverFailure);
    }
  }
}
