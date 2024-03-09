import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/features/auth/domain/entities/token_entity/token_entity.dart';
import 'package:chat_app/features/auth/domain/use_cases/login_use_case/login_use_case.dart';
import 'package:chat_app/features/auth/domain/use_cases/registration_use_case/registration_use_case.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, TokenEntity>> register(RegistrationParams params);

  Future<Either<Failure, TokenEntity>> login(LoginParams params);
}

