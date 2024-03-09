import 'package:bloc/bloc.dart';
import 'package:chat_app/features/auth/domain/use_cases/login_use_case/login_use_case.dart';
import 'package:chat_app/features/auth/domain/use_cases/registration_use_case/registration_use_case.dart';
import 'package:flutter/material.dart';

part 'auth_cubit_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.registrationUseCase,
    required this.loginUseCase,
  }) : super(
          AuthState(
            registrationParams: RegistrationParams(),
            loginParams: LoginParams(),
          ),
        );

  final RegistrationUseCase registrationUseCase;
  final LoginUseCase loginUseCase;

  AuthState _state = const AuthState(
    registrationParams: RegistrationParams(),
    loginParams: LoginParams(),
  );

  // Registration part
  void onRegistrationNameChanged(String name) {
    final RegistrationParams registrationParams = _state.registrationParams;

    if (registrationParams.name == name) return;

    _state = _state.copyWith(
      registrationParams: registrationParams.copyWith(name: name),
    );
    emit(_state);
  }

  void onRegistrationEmailChanged(String email) {
    final RegistrationParams registrationParams = _state.registrationParams;

    if (registrationParams.email == email) return;
    _state = _state.copyWith(
      registrationParams: registrationParams.copyWith(email: email),
    );
    emit(_state);
  }

  void onRegistrationPasswordChanged(String password) {
    final RegistrationParams registrationParams = _state.registrationParams;

    if (registrationParams.password == password) return;

    _state = _state.copyWith(
      registrationParams: registrationParams.copyWith(password: password),
    );
    emit(_state);
  }

  bool _validateRegistrationParams() {
    final RegistrationParams registrationParams = _state.registrationParams;
    bool allInputsValid = true;

    String nameError = '';
    String emailError = '';
    String passwordError = '';

    if (!_InputsValidator.validateName(registrationParams.name)) {
      allInputsValid = false;
      nameError = 'Name should be longer than 2 symbols.';
    }

    if (!_InputsValidator.validateEmail(registrationParams.email)) {
      allInputsValid = false;
      emailError = 'Incorrect email.';
    }

    if (!_InputsValidator.validatePassword(registrationParams.password)) {
      allInputsValid = false;
      passwordError = 'Password should be longer than 7 symbols.';
    }

    _state = _state.copyWith(
      registrationNameError: nameError,
      registrationEmailError: emailError,
      registrationPasswordError: passwordError,
    );
    emit(_state);

    return allInputsValid;
  }

  Future<void> onRegistrationButton() async {
    if (!_validateRegistrationParams()) return;

    _state = _state.copyWith(authInProcess: true);
    emit(_state);

    final failureOrToken = await registrationUseCase(_state.registrationParams);

    failureOrToken.fold(
      (failure) {
        const String errorMessage =
            'Could not register you. Check the correctness of the entered data.';

        _state = _state.copyWith(authError: errorMessage);
        emit(_state);
      },
      (tokenEntity) {
        _state = _state.copyWith(token: tokenEntity.token);
        emit(_state);
      },
    );

    _state = _state.copyWith(authInProcess: false);
    emit(_state);
  }

  // Login part
  void onLoginEmailChanged(String email) {
    final LoginParams loginParams = _state.loginParams;

    if (loginParams.email == email) return;
    _state = _state.copyWith(
      loginParams: loginParams.copyWith(email: email),
    );
    emit(_state);
  }

  void onLoginPasswordChanged(String password) {
    final LoginParams loginParams = _state.loginParams;

    if (loginParams.password == password) return;

    _state = _state.copyWith(
      loginParams: loginParams.copyWith(password: password),
    );
    emit(_state);
  }

  bool _validateLoginParams() {
    final LoginParams loginParams = _state.loginParams;
    bool allInputsValid = true;

    String emailError = '';

    if (!_InputsValidator.validateEmail(loginParams.email)) {
      allInputsValid = false;
      emailError = 'Incorrect email.';
    }

    _state = _state.copyWith(
      loginEmailError: emailError,
    );
    emit(_state);

    return allInputsValid;
  }

  Future<void> onLoginButton() async {
    if (!_validateLoginParams()) return;

    _state = _state.copyWith(authInProcess: true);
    emit(_state);

    final failureOrToken = await loginUseCase(_state.loginParams);

    failureOrToken.fold(
      (failure) {
        const String errorMessage =
            'Could not login you. Check the correctness of the entered data.';

        _state = _state.copyWith(authError: errorMessage);
        emit(_state);
      },
      (tokenEntity) {
        _state = _state.copyWith(token: tokenEntity.token);
        emit(_state);
      },
    );

    _state = _state.copyWith(authInProcess: false);
    emit(_state);
  }
}

class _InputsValidator {
  _InputsValidator._();

  static bool validateEmail(String email) =>
      email.contains('@') && email.length > 4;

  static bool validateName(String name) => name.length >= 3;

  static bool validatePassword(String password) => password.length > 7;
}
