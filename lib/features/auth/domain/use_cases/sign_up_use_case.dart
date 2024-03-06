import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/auth/domain/entities/token_entity/token_entity.dart';
import 'package:chat_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_use_case.freezed.dart';

part 'sign_up_use_case.g.dart';

class SignUpUseCase implements UseCase<TokenEntity, SignUpParams> {
  const SignUpUseCase({
    required this.repository,
  });

  final AuthRepository repository;

  @override
  Future<Either<Failure, TokenEntity>> call(SignUpParams params) async {
    return repository.signUp(params);
  }
}

@freezed
class SignUpParams with _$SignUpParams {
  const factory SignUpParams({
    @Default('') String name,
    @Default('') String email,
    @Default('') String password,
  }) = _SignUpParams;

  const SignUpParams._();

  factory SignUpParams.fromJson(Map<String, dynamic> json) =>
      _$SignUpParamsFromJson(json);
}
