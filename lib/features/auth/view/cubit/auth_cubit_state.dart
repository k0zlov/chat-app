part of 'auth_cubit.dart';

/// Represents the authentication state.
///
/// This class encapsulates the various parameters and flags
/// that define the current state of authentication in the application.
@immutable
class AuthState {
  /// Creates an instance of [AuthState].
  ///
  /// Parameters:
  ///   [registrationParams] The parameters used for user registration, defaults to an empty [RegistrationParams].
  ///   [loginParams] The parameters used for user login, defaults to an empty [LoginParams].
  ///   [authInProcess] Indicates if an authentication process is currently in progress, defaults to false.
  ///   [hidePassword] Indicates if the password should be hidden in the UI, defaults to true.
  ///   [currentUser] The currently authenticated user, defaults to an empty [UserEntity].
  const AuthState({
    this.registrationParams = const RegistrationParams(),
    this.loginParams = const LoginParams(),
    this.authInProcess = false,
    this.hidePassword = true,
    this.currentUser = const UserEntity(),
  });

  /// Indicates if an authentication process is currently in progress.
  final bool authInProcess;

  /// The parameters used for user registration.
  final RegistrationParams registrationParams;

  /// The parameters used for user login.
  final LoginParams loginParams;

  /// Indicates if the password should be hidden in the UI.
  final bool hidePassword;

  /// The currently authenticated user.
  final UserEntity currentUser;

  /// Creates a copy of the current state with updated values.
  ///
  /// Parameters:
  ///   [authInProcess] The new value for [authInProcess].
  ///   [registrationParams] The new value for [registrationParams].
  ///   [loginParams] The new value for [loginParams].
  ///   [hidePassword] The new value for [hidePassword].
  ///   [currentUser] The new value for [currentUser].
  ///
  /// Returns:
  ///   A new instance of [AuthState] with the updated values.
  AuthState copyWith({
    bool? authInProcess,
    RegistrationParams? registrationParams,
    LoginParams? loginParams,
    bool? hidePassword,
    UserEntity? currentUser,
  }) {
    return AuthState(
      authInProcess: authInProcess ?? this.authInProcess,
      registrationParams: registrationParams ?? this.registrationParams,
      loginParams: loginParams ?? this.loginParams,
      hidePassword: hidePassword ?? this.hidePassword,
      currentUser: currentUser ?? this.currentUser,
    );
  }
}
