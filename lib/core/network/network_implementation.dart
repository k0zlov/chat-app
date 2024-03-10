import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/network/network.dart';
import 'package:chat_app/di_container.dart';
import 'package:chat_app/utils/hive/hive_box.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Implementation of the Network interface for network operations.
class NetworkImpl implements Network {
  NetworkImpl({required String baseUrl}) {
    Network.setBaseUrl = baseUrl;
  }

  Dio get dio {
    final String token =
        getIt<HiveBoxMixin>().getData<String?>(HiveBoxKeys.token) ?? '';

    final Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    return Dio(
      BaseOptions(
        baseUrl: Network.baseUrl!,
        headers: headers,
      ),
    );
  }

  @override
  Future<Either<Failure, T>> get<T>({
    required String url,
    required Map<String, dynamic> queryParameters,
    required T Function(dynamic json) parser,
  }) async {
    const String defaultErrorMessage = 'Could not retrieve data from server.';

    try {
      final Response<dynamic> response = await dio.get(
        url,
        queryParameters: queryParameters,
      );

      final parsedData = parser(response.data);

      return Right(parsedData);
    } on DioException catch (e, stackTrace) {
      if (kDebugMode) {
        print('Error: $e \nStack Trace: \n$stackTrace');
      }

      final serverFailure = ServerFailure(
        errorMessage: e.message ?? defaultErrorMessage,
      );

      return Left(serverFailure);
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Error: $e \nStack Trace: \n$stackTrace');
      }

      const serverFailure = ServerFailure(
        errorMessage: defaultErrorMessage,
      );

      return const Left(serverFailure);
    }
  }

  @override
  Future<Either<Failure, T>> post<T>({
    required String url,
    required Map<String, dynamic> data,
    required T Function(dynamic json) parser,
  }) async {
    const String defaultErrorMessage = 'Could not retrieve data from server.';

    try {
      final Response<dynamic> response = await dio.post(
        url,
        data: data,
      );

      final parsedData = parser(response.data);

      return Right(parsedData);
    } on DioException catch (e, stackTrace) {
      if (kDebugMode) {
        print('Error: $e \nStack Trace: \n$stackTrace');
      }

      final String? errorText = e.response?.data?['message'] as String?;

      final serverFailure = ServerFailure(
        errorMessage: errorText ?? defaultErrorMessage,
      );
      return Left(serverFailure);
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Error: $e \nStack Trace: \n$stackTrace');
      }

      const ServerFailure serverFailure = ServerFailure(
        errorMessage: defaultErrorMessage,
      );

      return const Left(serverFailure);
    }
  }
}
