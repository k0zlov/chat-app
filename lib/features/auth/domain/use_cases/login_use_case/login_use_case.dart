import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/auth/domain/entities/user_entity/user_entity.dart';
import 'package:chat_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_use_case.freezed.dart';
part 'login_use_case.g.dart';

/// A use case for logging in a user.
///
/// This use case calls the [AuthRepository] to perform the login operation.
class LoginUseCase implements UseCase<UserEntity, LoginParams> {
  /// Constructs an instance of [LoginUseCase] with the given repository.
  ///
  /// Parameters:
  ///   [repository] The [AuthRepository] used to perform the login operation.
  const LoginUseCase({
    required this.repository,
  });

  /// The repository that provides user authentication-related operations.
  final AuthRepository repository;

  /// Executes the use case to log in a user.
  ///
  /// Parameters:
  ///   [params] An instance of [LoginParams] containing the user's email and password.
  ///
  /// Returns:
  ///   A Future that resolves to an Either type, containing a [Failure] on error,
  ///   or a [UserEntity] on success, representing the authenticated user's details.
  @override
  Future<Either<Failure, UserEntity>> call(LoginParams params) async {
    return repository.login(params);
  }
}

/// Parameters required for logging in a user.
///
/// This class is generated using Freezed for immutable data structures.
@freezed
class LoginParams with _$LoginParams {
  /// Constructs an instance of [LoginParams] with the given email and password.
  ///
  /// Parameters:
  ///   [email] The email address of the user.
  ///   [password] The password of the user.
  const factory LoginParams({
    @Default('') String email,
    @Default('') String password,
  }) = _LoginParams;

  const LoginParams._();

  /// Creates an instance of [LoginParams] from a JSON object.
  ///
  /// Parameters:
  ///   [json] A JSON object containing the login parameters.
  ///
  /// Returns:
  ///   An instance of [LoginParams].
  factory LoginParams.fromJson(Map<String, dynamic> json) =>
      _$LoginParamsFromJson(json);
}
