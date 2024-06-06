import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

/// A use case for logging out the currently authenticated user.
///
/// This use case calls the [AuthRepository] to perform the logout operation.
class LogoutUseCase implements UseCase<void, NoParams> {
  /// Constructs an instance of [LogoutUseCase] with the given repository.
  ///
  /// Parameters:
  ///   [repository] The [AuthRepository] used to perform the logout operation.
  const LogoutUseCase({
    required this.repository,
  });

  /// The repository that provides user authentication-related operations.
  final AuthRepository repository;

  /// Executes the use case to log out the current user.
  ///
  /// Parameters:
  ///   [params] An instance of [NoParams] as this use case does not require any parameters.
  ///
  /// Returns:
  ///   A Future that resolves to an Either type, containing a [Failure] on error,
  ///   or void on successful logout, indicating that the operation completed successfully.
  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return repository.logout();
  }
}
