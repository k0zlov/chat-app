part of 'auth_cubit.dart';

@immutable
class AuthState {
  const AuthState({
    this.registrationParams = const RegistrationParams(),
    this.loginParams = const LoginParams(),
    this.authInProcess = false,
    this.hidePassword = true,
    this.currentUser = const UserEntity(),
  });

  final bool authInProcess;
  final RegistrationParams registrationParams;
  final LoginParams loginParams;

  final bool hidePassword;

  final UserEntity currentUser;

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
