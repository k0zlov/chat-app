part of 'auth_cubit.dart';

@immutable
class AuthState {
  const AuthState({
    this.registrationParams = const RegistrationParams(),
    this.loginParams = const LoginParams(),
    this.authInProcess = false,
    this.hidePassword = true,
  });

  final bool authInProcess;
  final RegistrationParams registrationParams;
  final LoginParams loginParams;

  final bool hidePassword;

  AuthState copyWith({
    bool? authInProcess,
    RegistrationParams? registrationParams,
    LoginParams? loginParams,
    bool? hidePassword,
  }) {
    return AuthState(
      authInProcess: authInProcess ?? this.authInProcess,
      registrationParams: registrationParams ?? this.registrationParams,
      loginParams: loginParams ?? this.loginParams,
      hidePassword: hidePassword ?? this.hidePassword,
    );
  }
}
