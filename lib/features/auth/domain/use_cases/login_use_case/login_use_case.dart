import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/auth/domain/entities/token_entity/token_entity.dart';
import 'package:chat_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_use_case.freezed.dart';

part 'login_use_case.g.dart';

class LoginUseCase implements UseCase<TokenResponseEntity, LoginParams> {
  const LoginUseCase({
    required this.repository,
  });

  final AuthRepository repository;

  @override
  Future<Either<Failure, TokenResponseEntity>> call(LoginParams params) async {
    return repository.login(params);
  }
}

@freezed
class LoginParams with _$LoginParams {
  const factory LoginParams({
    @Default('') String email,
    @Default('') String password,
  }) = _LoginParams;

  const LoginParams._();

  factory LoginParams.fromJson(Map<String, dynamic> json) =>
      _$LoginParamsFromJson(json);
}
