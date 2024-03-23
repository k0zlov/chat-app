part of 'auth_cubit.dart';

@immutable
class AuthState {
  const AuthState({
    this.registrationParams = const RegistrationParams(),
    this.loginParams = const LoginParams(),
    this.authInProcess = false,
    this.hidePassword = true,
    this.authError = '',
  });

  final bool authInProcess;
  final RegistrationParams registrationParams;
  final LoginParams loginParams;

  final String authError;

  final bool hidePassword;

  AuthState copyWith({
    bool? authInProcess,
    String? token,
    RegistrationParams? registrationParams,
    LoginParams? loginParams,
    String? authError,
    String? registrationNameError,
    String? registrationEmailError,
    String? registrationPasswordError,
    String? loginEmailError,
    String? loginPasswordError,
    bool? hidePassword,
  }) {
    return AuthState(
      authInProcess: authInProcess ?? this.authInProcess,
      registrationParams: registrationParams ?? this.registrationParams,
      loginParams: loginParams ?? this.loginParams,
      authError: authError ?? this.authError,
      hidePassword: hidePassword ?? this.hidePassword,
    );
  }
}
