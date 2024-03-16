import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/auth/domain/entities/token_entity/token_entity.dart';
import 'package:chat_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_use_case.freezed.dart';

part 'registration_use_case.g.dart';

// To reg use case
class RegistrationUseCase implements UseCase<TokenResponseEntity, RegistrationParams> {
  const RegistrationUseCase({
    required this.repository,
  });

  final AuthRepository repository;

  @override
  Future<Either<Failure, TokenResponseEntity>> call(RegistrationParams params) async {
    return repository.register(params);
  }
}

//

@freezed
class RegistrationParams with _$RegistrationParams {
  const factory RegistrationParams({
    @Default('') String name,
    @Default('') String email,
    @Default('') String password,
  }) = _RegistrationParams;

  const RegistrationParams._();

  factory RegistrationParams.fromJson(Map<String, dynamic> json) =>
      _$RegistrationParamsFromJson(json);
}
