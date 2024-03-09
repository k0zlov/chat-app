part of 'auth_cubit.dart';

@immutable
class AuthState {
  const AuthState({
    required this.registrationParams,
    required this.loginParams,
    this.authInProcess = false,
    this.hidePassword = true,
    this.authError = '',
    this.registrationNameError = '',
    this.registrationEmailError = '',
    this.registrationPasswordError = '',
    this.loginEmailError = '',
    this.loginPasswordError = '',
    this.token = '',
  });

  final bool authInProcess;

  final String token;

  final RegistrationParams registrationParams;
  final LoginParams loginParams;

  final String authError;

  final String registrationNameError;
  final String registrationEmailError;
  final String registrationPasswordError;

  final String loginEmailError;
  final String loginPasswordError;

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
      token: token ?? this.token,
      registrationParams: registrationParams ?? this.registrationParams,
      loginParams: loginParams ?? this.loginParams,
      authError: authError ?? this.authError,
      registrationNameError:
          registrationNameError ?? this.registrationNameError,
      registrationEmailError:
          registrationEmailError ?? this.registrationEmailError,
      registrationPasswordError:
          registrationPasswordError ?? this.registrationPasswordError,
      loginEmailError: loginEmailError ?? this.loginEmailError,
      loginPasswordError: loginPasswordError ?? this.loginPasswordError,
      hidePassword: hidePassword ?? this.hidePassword,
    );
  }
}
