import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/features/auth/data/models/token_model/token_model.dart';
import 'package:chat_app/features/auth/data/providers/remote/auth_remote_provider.dart';
import 'package:chat_app/features/auth/domain/entities/token_entity/token_entity.dart';
import 'package:chat_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:chat_app/features/auth/domain/use_cases/login_use_case/login_use_case.dart';
import 'package:chat_app/features/auth/domain/use_cases/registration_use_case/registration_use_case.dart';
import 'package:chat_app/utils/hive/hive_box.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({
    required this.remoteProvider,
    required this.hiveBoxMixin,
  });

  final AuthRemoteProvider remoteProvider;
  final HiveBoxMixin hiveBoxMixin;

  @override
  Future<Either<Failure, TokenEntity>> register(
    RegistrationParams params,
  ) async {
    final Either<Failure, TokenModel> response = await remoteProvider.register(
      params,
    );

    return response.fold(
      // ignore: unnecessary_lambdas
      (failure) => Left(failure),
      (tokenModel) async {
        await hiveBoxMixin.loginBox(token: tokenModel.token);
        return Right(tokenModel.toEntity());
      },
    );
  }

  @override
  Future<Either<Failure, TokenEntity>> login(LoginParams params) async {
    final Either<Failure, TokenModel> response = await remoteProvider.login(
      params,
    );

    return response.fold(
      // ignore: unnecessary_lambdas
      (failure) => Left(failure),
      (tokenModel) async {
        await hiveBoxMixin.loginBox(token: tokenModel.token);
        return Right(tokenModel.toEntity());
      },
    );
  }
}
