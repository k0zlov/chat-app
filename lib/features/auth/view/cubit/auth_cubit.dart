import 'package:bloc/bloc.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/auth/domain/use_cases/login_use_case/login_use_case.dart';
import 'package:chat_app/features/auth/domain/use_cases/logout_use_case/logout_use_case.dart';
import 'package:chat_app/features/auth/domain/use_cases/registration_use_case/registration_use_case.dart';
import 'package:chat_app/utils/text_input_validator/text_input_validator.dart';
import 'package:flutter/material.dart';

part 'auth_cubit_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.registrationUseCase,
    required this.loginUseCase,
    required this.logoutUseCase,
  }) : super(AuthState());

  final RegistrationUseCase registrationUseCase;
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;

  AuthState _state = const AuthState();

  Future<void> logout() async {
    final failureOrVoid = await logoutUseCase(NoParams());
    _state = const AuthState();
    failureOrVoid.fold(
      (failure) {
        _state = _state.copyWith(authError: failure.errorMessage);
      },
      (r) => null,
    );
    emit(_state);
  }

  bool checkLoginParams() {
    final LoginParams loginParams = _state.loginParams;

    final String email = loginParams.email;
    final String password = loginParams.password;

    if (TextInputValidator.validateEmail(email) != null || email.isEmpty) {
      return false;
    }

    if (password.isEmpty) {
      return false;
    }
    return true;
  }

  bool checkRegistrationParams() {
    final RegistrationParams registrationParams = _state.registrationParams;

    final String name = registrationParams.name;
    final String email = registrationParams.email;
    final String password = registrationParams.password;

    if (TextInputValidator.validateName(name) != null || name.isEmpty) {
      return false;
    }

    if (TextInputValidator.validateEmail(email) != null || email.isEmpty) {
      return false;
    }

    if (TextInputValidator.validatePassword(password) != null ||
        password.isEmpty) {
      return false;
    }

    return true;
  }

  void onLoginEmail(String email) {
    final LoginParams loginParams = _state.loginParams;
    _state = _state.copyWith(
      loginParams: loginParams.copyWith(email: email),
    );
    emit(_state);
  }

  void onLoginPassword(String password) {
    final LoginParams loginParams = _state.loginParams;
    _state = _state.copyWith(
      loginParams: loginParams.copyWith(password: password),
    );
    emit(_state);
  }

  void onRegistrationName(String name) {
    final RegistrationParams registrationParams = _state.registrationParams;
    _state = _state.copyWith(
      registrationParams: registrationParams.copyWith(name: name),
    );
    emit(_state);
  }

  void onRegistrationEmail(String email) {
    final RegistrationParams registrationParams = _state.registrationParams;
    _state = _state.copyWith(
      registrationParams: registrationParams.copyWith(email: email),
    );
    emit(_state);
  }

  void onRegistrationPassword(String password) {
    final RegistrationParams registrationParams = _state.registrationParams;
    _state = _state.copyWith(
      registrationParams: registrationParams.copyWith(password: password),
    );
    emit(_state);
  }

  void clearAuthError() {
    _state = _state.copyWith(authError: '');
    emit(_state);
  }

  Future<void> onLoginButton() async {
    if (!checkLoginParams()) {
      _state = _state.copyWith(
        authError: 'The data you entered is incorrect. Please try again.',
      );
      emit(_state);
      return;
    }

    _state = _state.copyWith(authInProcess: true);
    emit(_state);

    final failureOrToken = await loginUseCase(_state.loginParams);

    failureOrToken.fold(
      (failure) {
        _state = _state.copyWith(authError: failure.errorMessage);
      },
      (tokenEntity) => null,
    );

    _state = _state.copyWith(authInProcess: false);
    emit(_state);
  }

  Future<void> onRegistrationButton() async {
    if (!checkRegistrationParams()) {
      _state = _state.copyWith(
        authError: 'The data you entered is incorrect. Please try again.',
      );
      emit(_state);
      return;
    }

    _state = _state.copyWith(authInProcess: true);
    emit(_state);

    final failureOrToken = await registrationUseCase(_state.registrationParams);

    failureOrToken.fold(
      (failure) {
        _state = _state.copyWith(authError: failure.errorMessage);
      },
      (tokenEntity) => null,
    );

    _state = _state.copyWith(authInProcess: false);
    emit(_state);
  }

  void onHidePassword() {
    _state = _state.copyWith(hidePassword: !_state.hidePassword);
    emit(_state);
  }
}
