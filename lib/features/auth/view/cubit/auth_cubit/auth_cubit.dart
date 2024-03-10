import 'package:bloc/bloc.dart';
import 'package:chat_app/core/widgets/error_snack_bar.dart';
import 'package:chat_app/features/auth/domain/use_cases/login_use_case/login_use_case.dart';
import 'package:chat_app/features/auth/domain/use_cases/registration_use_case/registration_use_case.dart';
import 'package:chat_app/utils/hive/hive_box.dart';
import 'package:chat_app/utils/text_input_validator/text_input_validator.dart';
import 'package:flutter/material.dart';

part 'auth_cubit_state.dart';

class AuthCubit extends Cubit<AuthState> with HiveBoxMixin {
  AuthCubit({
    required this.registrationUseCase,
    required this.loginUseCase,
  }) : super(AuthState());

  final RegistrationUseCase registrationUseCase;
  final LoginUseCase loginUseCase;

  AuthState _state = const AuthState();

  // Registration part
  void onRegistrationNameChanged(String name) {
    final RegistrationParams registrationParams = _state.registrationParams;

    if (registrationParams.name == name) return;

    final String nameError = TextInputValidator.validateName(name);
    _state = _state.copyWith(registrationNameError: nameError);

    if (name == '') {
      _state = _state.copyWith(registrationNameError: '');
    }

    _state = _state.copyWith(
      registrationParams: registrationParams.copyWith(name: name),
    );
    emit(_state);
  }

  void onRegistrationEmailChanged(String email) {
    final RegistrationParams registrationParams = _state.registrationParams;

    if (registrationParams.email == email) return;

    final String emailError = TextInputValidator.validateEmail(email);
    _state = _state.copyWith(registrationEmailError: emailError);

    if (email == '') {
      _state = _state.copyWith(registrationEmailError: '');
    }

    _state = _state.copyWith(
      registrationParams: registrationParams.copyWith(email: email),
    );
    emit(_state);
  }

  void onRegistrationPasswordChanged(String password) {
    final RegistrationParams registrationParams = _state.registrationParams;

    if (registrationParams.password == password) return;

    final String passwordError = TextInputValidator.validatePassword(password);
    _state = _state.copyWith(registrationPasswordError: passwordError);

    if (password == '') {
      _state = _state.copyWith(registrationPasswordError: '');
    }

    _state = _state.copyWith(
      registrationParams: registrationParams.copyWith(password: password),
    );
    emit(_state);
  }

  bool _validateRegistrationParams() {
    final RegistrationParams registrationParams = _state.registrationParams;
    bool allInputsValid = true;

    final String nameError = TextInputValidator.validateName(
      registrationParams.name,
    );
    final String emailError = TextInputValidator.validateEmail(
      registrationParams.email,
    );
    final String passwordError = TextInputValidator.validatePassword(
      registrationParams.password,
    );

    if (nameError != '' || emailError != '' || passwordError != '') {
      allInputsValid = false;
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
        _state = _state.copyWith(authError: failure.errorMessage);
      },
      (tokenEntity) {
        _state = _state.copyWith(token: tokenEntity.token);
      },
    );

    _state = _state.copyWith(authInProcess: false);
    emit(_state);
  }

  // Login part
  void onLoginEmailChanged(String email) {
    final LoginParams loginParams = _state.loginParams;

    if (loginParams.email == email) return;

    final String emailError = TextInputValidator.validateEmail(email);
    _state = _state.copyWith(loginEmailError: emailError);

    if (email == '') {
      _state = _state.copyWith(loginEmailError: '');
    }

    _state = _state.copyWith(
      loginParams: loginParams.copyWith(email: email),
    );
    emit(_state);
  }

  void onLoginPasswordChanged(String password) {
    final LoginParams loginParams = _state.loginParams;

    if (loginParams.password == password) return;

    if (password == '') {
      _state = _state.copyWith(loginPasswordError: '');
    }

    _state = _state.copyWith(
      loginParams: loginParams.copyWith(password: password),
    );
    emit(_state);
  }

  bool _validateLoginParams() {
    final LoginParams loginParams = _state.loginParams;
    bool allInputsValid = true;

    final String emailError = TextInputValidator.validateEmail(
      loginParams.email,
    );

    if (emailError != '') {
      allInputsValid = false;
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
        _state = _state.copyWith(authError: failure.errorMessage);
      },
      (tokenEntity) {
        _state = _state.copyWith(token: tokenEntity.token);
      },
    );

    _state = _state.copyWith(authInProcess: false);
    emit(_state);
  }

  void showAuthError(BuildContext context) {
    final String errorMessage = _state.authError;

    if (errorMessage == '') return;

    ScaffoldMessenger.of(context).showSnackBar(
      ErrorSnackBar(errorMessage: errorMessage),
    );

    _state = _state.copyWith(authError: '');
    emit(_state);
  }

  void onHidePasswordButton() {
    _state = _state.copyWith(hidePassword: !_state.hidePassword);
    emit(_state);
  }

  Future<void> logout() async {
    await logoutBox();
    _state = const AuthState();
    emit(_state);
  }
}
