import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/auth/domain/entities/user_entity/user_entity.dart';
import 'package:chat_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_use_case.freezed.dart';
part 'registration_use_case.g.dart';

/// A use case for registering a new user.
///
/// This use case calls the [AuthRepository] to perform the registration operation.
class RegistrationUseCase implements UseCase<UserEntity, RegistrationParams> {
  /// Constructs an instance of [RegistrationUseCase] with the given repository.
  ///
  /// Parameters:
  ///   [repository] The [AuthRepository] used to perform the registration operation.
  const RegistrationUseCase({
    required this.repository,
  });

  /// The repository that provides user authentication-related operations.
  final AuthRepository repository;

  /// Executes the use case to register a new user.
  ///
  /// Parameters:
  ///   [params] An instance of [RegistrationParams] containing the user's name, email, and password.
  ///
  /// Returns:
  ///   A Future that resolves to an Either type, containing a [Failure] on error,
  ///   or a [UserEntity] on successful registration, representing the registered user's details.
  @override
  Future<Either<Failure, UserEntity>> call(RegistrationParams params) async {
    return repository.register(params);
  }
}

/// Parameters required for registering a new user.
///
/// This class is generated using Freezed for immutable data structures.
@freezed
class RegistrationParams with _$RegistrationParams {
  /// Constructs an instance of [RegistrationParams] with the given name, email, and password.
  ///
  /// Parameters:
  ///   [name] The name of the user.
  ///   [email] The email address of the user.
  ///   [password] The password of the user.
  const factory RegistrationParams({
    @Default('') String name,
    @Default('') String email,
    @Default('') String password,
  }) = _RegistrationParams;

  const RegistrationParams._();

  /// Creates an instance of [RegistrationParams] from a JSON object.
  ///
  /// Parameters:
  ///   [json] A JSON object containing the registration parameters.
  ///
  /// Returns:
  ///   An instance of [RegistrationParams].
  factory RegistrationParams.fromJson(Map<String, dynamic> json) =>
      _$RegistrationParamsFromJson(json);
}
