import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/network/api_endpoints.dart';
import 'package:chat_app/core/network/network.dart';
import 'package:chat_app/features/auth/data/models/token_model/token_model.dart';
import 'package:chat_app/features/auth/data/models/user_model/user_model.dart';
import 'package:chat_app/features/auth/domain/use_cases/login_use_case/login_use_case.dart';
import 'package:chat_app/features/auth/domain/use_cases/registration_use_case/registration_use_case.dart';
import 'package:chat_app/features/auth/domain/use_cases/update_user_use_case/update_user_use_case.dart';
import 'package:dartz/dartz.dart';

/// An interface that defines the contract for remote authentication provider.
/// It contains methods for registering, logging in, and logging out users.
abstract interface class AuthRemoteProvider {
  /// Gets the current user data.
  ///
  /// Returns a [Future] that completes with either a [Failure] or [UserModel].
  Future<Either<Failure, UserModel>> getCurrentUser();

  /// Registers a new user with the provided [params].
  ///
  /// Returns a [Future] that completes with either a [Failure] or [TokenResponseModel].
  Future<Either<Failure, TokenResponseModel>> register(
    RegistrationParams params,
  );

  /// Logs in a user with the provided [params].
  ///
  /// Returns a [Future] that completes with either a [Failure] or [TokenResponseModel].
  Future<Either<Failure, TokenResponseModel>> login(
    LoginParams params,
  );

  /// Logs out the current user.
  ///
  /// Returns a [Future] that completes with either a [Failure] or [void].
  Future<Either<Failure, void>> logout();

  Future<Either<Failure, UserModel>> updateUser(UpdateUserParams params);
}

/// Implementation of [AuthRemoteProvider] that uses a [Network] instance
/// to make HTTP requests.
class AuthRemoteProviderImpl implements AuthRemoteProvider {
  /// Creates an instance of [AuthRemoteProviderImpl] with the given [network].
  const AuthRemoteProviderImpl({
    required this.network,
  });

  /// The [Network] instance used for making HTTP requests.
  final Network network;

  @override
  Future<Either<Failure, UserModel>> getCurrentUser() async {
    // Makes a GET request to the auth endpoint.
    final Either<Failure, UserModel> response = await network.get(
      url: ApiEndpoints.authRoute,
      parser: (json) {
        final data = json as Map<String, dynamic>;

        return UserModel.fromJson(data);
      },
    );

    return response;
  }

  @override
  Future<Either<Failure, TokenResponseModel>> register(
    RegistrationParams params,
  ) async {
    // Makes a POST request to the registration endpoint with the provided [params].
    final Either<Failure, TokenResponseModel> response = await network.post(
      url: ApiEndpoints.postRegistration,
      data: params.toJson(),
      parser: (json) {
        final data = json as Map<String, dynamic>;
        return TokenResponseModel.fromJson(data);
      },
    );
    return response;
  }

  @override
  Future<Either<Failure, TokenResponseModel>> login(LoginParams params) async {
    // Makes a POST request to the login endpoint with the provided [params].
    final Either<Failure, TokenResponseModel> response = await network.post(
      url: ApiEndpoints.postLogin,
      data: params.toJson(),
      parser: (json) {
        final data = json as Map<String, dynamic>;
        return TokenResponseModel.fromJson(data);
      },
    );
    return response;
  }

  @override
  Future<Either<Failure, void>> logout() async {
    // Makes a POST request to the logout endpoint.
    final Either<Failure, void> response = await network.post(
      url: ApiEndpoints.postLogout,
      parser: (json) {},
    );
    return response;
  }

  @override
  Future<Either<Failure, UserModel>> updateUser(
    UpdateUserParams params,
  ) async {
    final response = await network.put(
      url: ApiEndpoints.putUserUpdate,
      data: params.toJson(),
      parser: (json) {
        final data = json as Map<String, dynamic>;
        return UserModel.fromJson(data);
      },
    );

    return response;
  }
}
