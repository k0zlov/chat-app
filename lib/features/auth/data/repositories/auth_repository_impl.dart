import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/services/auth_service.dart';
import 'package:chat_app/features/auth/data/models/token_model/token_model.dart';
import 'package:chat_app/features/auth/data/providers/remote/auth_remote_provider.dart';
import 'package:chat_app/features/auth/domain/entities/token_entity/token_entity.dart';
import 'package:chat_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:chat_app/features/auth/domain/use_cases/login_use_case/login_use_case.dart';
import 'package:chat_app/features/auth/domain/use_cases/registration_use_case/registration_use_case.dart';
import 'package:dartz/dartz.dart';

/// An implementation of [AuthRepository] that uses a remote provider and an
/// authentication service to perform authentication operations.
class AuthRepositoryImpl implements AuthRepository {
  /// Constructs an instance of [AuthRepositoryImpl] with the necessary dependencies.
  ///
  /// Parameters:
  ///   [remoteProvider] An instance of [AuthRemoteProvider] for handling network requests.
  ///   [authService] An instance of [AuthService] for managing authentication state.
  const AuthRepositoryImpl({
    required this.remoteProvider,
    required this.authService,
  });

  /// The remote provider for authentication-related network requests.
  final AuthRemoteProvider remoteProvider;

  /// The service responsible for managing the application's authentication state.
  final AuthService authService;

  /// Registers a new user with the provided registration parameters.
  ///
  /// This method uses [remoteProvider] to perform the registration request and then
  /// logs the user in using [authService] if the registration is successful.
  ///
  /// Parameters:
  ///   [params] The registration parameters, including user details.
  ///
  /// Returns:
  ///   A Future that resolves to an Either type, containing a [Failure] on error,
  ///   or a [TokenResponseEntity] on successful registration.
  @override
  Future<Either<Failure, TokenResponseEntity>> register(
    RegistrationParams params,
  ) async {
    final Either<Failure, TokenResponseModel> response =
        await remoteProvider.register(params);

    return response.fold(
      // ignore: unnecessary_lambdas
      (failure) => Left(failure),
      (tokenModel) async {
        await authService.login(
          accessToken: tokenModel.accessToken,
          refreshToken: tokenModel.refreshToken,
        );
        return Right(tokenModel.toEntity());
      },
    );
  }

  /// Logs in a user with the provided login parameters.
  ///
  /// This method uses [remoteProvider] to perform the login request and updates
  /// the authentication state using [authService] if the login is successful.
  ///
  /// Parameters:
  ///   [params] The login parameters, including user credentials.
  ///
  /// Returns:
  ///   A Future that resolves to an Either type, containing a [Failure] on error,
  ///   or a [TokenResponseEntity] on successful login.
  @override
  Future<Either<Failure, TokenResponseEntity>> login(LoginParams params) async {
    final Either<Failure, TokenResponseModel> response =
        await remoteProvider.login(params);

    return response.fold(
      // ignore: unnecessary_lambdas
      (failure) => Left(failure),
      (tokenModel) async {
        await authService.login(
          accessToken: tokenModel.accessToken,
          refreshToken: tokenModel.refreshToken,
        );
        return Right(tokenModel.toEntity());
      },
    );
  }

  /// Logs out the currently authenticated user.
  ///
  /// This method uses [authService] to clear the authentication state.
  ///
  /// Returns:
  ///   A Future that resolves to an Either type, containing a [Failure] on error,
  ///   or void on successful logout.
  @override
  Future<Either<Failure, void>> logout() async {
    final Either<Failure, void> response = await remoteProvider.logout();
    await authService.logout();

    return response;
  }
}
