import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/services/auth_service.dart';
import 'package:chat_app/features/auth/data/models/token_model/token_model.dart';
import 'package:chat_app/features/auth/data/models/user_model/user_model.dart';
import 'package:chat_app/features/auth/data/providers/remote/auth_remote_provider.dart';
import 'package:chat_app/features/auth/domain/entities/user_entity/user_entity.dart';
import 'package:chat_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:chat_app/features/auth/domain/use_cases/login_use_case/login_use_case.dart';
import 'package:chat_app/features/auth/domain/use_cases/registration_use_case/registration_use_case.dart';
import 'package:chat_app/features/auth/domain/use_cases/update_user_use_case/update_user_use_case.dart';
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

  /// Retrieves the currently authenticated user.
  ///
  /// This method uses the [remoteProvider] to fetch the current user's details
  /// and converts the resulting [UserModel] to a [UserEntity].
  ///
  /// Returns:
  ///   A Future that resolves to an Either type, containing a [Failure] on error,
  ///   or a [UserEntity] on success, representing the authenticated user's details.
  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    final Either<Failure, UserModel> response =
        await remoteProvider.getCurrentUser();

    return response.fold(
      // ignore: unnecessary_lambdas
      (failure) => Left(failure),
      (userModel) {
        final UserEntity entity = userModel.toEntity();
        return Right(entity);
      },
    );
  }

  /// Registers a new user with the provided registration parameters.
  ///
  /// This method uses [remoteProvider] to perform the registration request and then
  /// retrieves the current user's details using [getCurrentUser]. If the registration
  /// is successful, it logs the user in using [authService].
  ///
  /// Parameters:
  ///   [params] The registration parameters, including user details.
  ///
  /// Returns:
  ///   A Future that resolves to an Either type, containing a [Failure] on error,
  ///   or a [UserEntity] on successful registration, representing the registered user's details.
  @override
  Future<Either<Failure, UserEntity>> register(
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

        return getCurrentUser();
      },
    );
  }

  /// Logs in a user with the provided login parameters.
  ///
  /// This method uses [remoteProvider] to perform the login request and then
  /// retrieves the current user's details using [getCurrentUser]. If the login
  /// is successful, it updates the authentication state using [authService].
  ///
  /// Parameters:
  ///   [params] The login parameters, including user credentials.
  ///
  /// Returns:
  ///   A Future that resolves to an Either type, containing a [Failure] on error,
  ///   or a [UserEntity] on successful login, representing the authenticated user's details.
  @override
  Future<Either<Failure, UserEntity>> login(LoginParams params) async {
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

        return getCurrentUser();
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

  /// Updates the user information by calling the remote provider with the given parameters.
  ///
  /// This method overrides the base class implementation of [updateUser].
  /// It makes an asynchronous call to [remoteProvider] and returns an [Either] type
  /// which contains a [Failure] on the left side in case of an error, or a [UserEntity] on the right side upon success.
  ///
  /// Parameters:
  /// - [params]: An instance of [UpdateUserParams] containing the user information to be updated.
  ///
  /// Returns:
  /// - A [Future] which completes with either a [Failure] or a [UserEntity].
  @override
  Future<Either<Failure, UserEntity>> updateUser(
    UpdateUserParams params,
  ) async {
    final response = await remoteProvider.updateUser(params);

    return response.fold(
      // ignore: unnecessary_lambdas
      (failure) => Left(failure),
      (model) {
        final UserEntity entity = model.toEntity();
        return Right(entity);
      },
    );
  }
}
