import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/features/auth/domain/entities/token_entity/token_entity.dart';
import 'package:chat_app/features/auth/domain/use_cases/login_use_case/login_use_case.dart';
import 'package:chat_app/features/auth/domain/use_cases/registration_use_case/registration_use_case.dart';
import 'package:dartz/dartz.dart';

/// Represents the contract for authentication-related data operations.
///
/// This abstract class defines methods for user registration, login, and logout,
/// which must be implemented by concrete classes. It utilizes functional error handling
/// with the Either type, allowing for clear separation of success and failure cases.
abstract interface class AuthRepository {
  /// Registers a new user with the provided registration parameters.
  ///
  /// Parameters:
  ///   [params] The [RegistrationParams] required to register a new user, including
  ///            user credentials and other registration details.
  ///
  /// Returns:
  ///   A Future that resolves to an Either type, containing a [Failure] on error,
  ///   or a [TokenResponseEntity] on successful registration, representing the user's authentication token.
  Future<Either<Failure, TokenResponseEntity>> register(RegistrationParams params);

  /// Logs in a user with the provided login parameters.
  ///
  /// Parameters:
  ///   [params] The [LoginParams] required for logging in, including user credentials.
  ///
  /// Returns:
  ///   A Future that resolves to an Either type, containing a [Failure] on error,
  ///   or a [TokenResponseEntity] on successful login, representing the user's authentication token.
  Future<Either<Failure, TokenResponseEntity>> login(LoginParams params);

  /// Logs out the currently authenticated user.
  ///
  /// This method should handle necessary operations for logging out, such as
  /// invalidating the user's authentication token and clearing any session data.
  ///
  /// Returns:
  ///   A Future that resolves to an Either type, containing a [Failure] on error,
  ///   or a void type on successful logout, indicating that the operation completed successfully.
  Future<Either<Failure, void>> logout();
}
