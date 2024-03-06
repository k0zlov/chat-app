import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/features/auth/domain/entities/token_entity/token_entity.dart';
import 'package:chat_app/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, TokenEntity>> signUp(SignUpParams params);
}

