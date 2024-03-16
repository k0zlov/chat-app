import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/network/api_endpoints.dart';
import 'package:chat_app/core/network/network.dart';
import 'package:chat_app/features/auth/data/models/token_model/token_model.dart';
import 'package:chat_app/features/auth/domain/use_cases/login_use_case/login_use_case.dart';
import 'package:chat_app/features/auth/domain/use_cases/registration_use_case/registration_use_case.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRemoteProvider {
  Future<Either<Failure, TokenModel>> register(RegistrationParams params);

  Future<Either<Failure, TokenModel>> login(LoginParams params);
}

class AuthRemoteProviderImpl implements AuthRemoteProvider {
  const AuthRemoteProviderImpl({
    required this.network,
  });

  final Network network;

  @override
  Future<Either<Failure, TokenModel>> register(
    RegistrationParams params,
  ) async {
    final Either<Failure, TokenModel> response = await network.post(
      url: APIEndpoints.postRegistration,
      data: params.toJson(),
      parser: (json) {
        final data = json as Map<String, dynamic>;
        return TokenModel.fromJson(data);
      },
    );
    return response;
  }

  @override
  Future<Either<Failure, TokenModel>> login(LoginParams params) async {
    final Either<Failure, TokenModel> response = await network.post(
      url: APIEndpoints.postLogin,
      data: params.toJson(),
      parser: (json) {
        final data = json as Map<String, dynamic>;
        return TokenModel.fromJson(data);
      },
    );
    return response;
  }
}
