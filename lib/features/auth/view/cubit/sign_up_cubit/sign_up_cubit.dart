import 'package:bloc/bloc.dart';
import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/features/auth/domain/entities/token_entity/token_entity.dart';
import 'package:chat_app/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required this.signUpUseCase}) : super(SignUpStateInitial());

  final SignUpUseCase signUpUseCase;

  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  TextEditingController get emailController => _emailController;

  TextEditingController get nameController => _nameController;

  TextEditingController get passwordController => _passwordController;

  bool checkEmail() {
    final String email = emailController.text;

    final bool isValid = SignUpFormValidator.validateEmail(email);

    if (isValid) {
      if (state is SignUpStateFailure) {
        emit(
          SignUpStateFailure(
            nameError: (state as SignUpStateFailure).nameError,
            passwordError: (state as SignUpStateFailure).passwordError,
          ),
        );
      } else {
        emit(SignUpStateInitial());
      }
    }
    return isValid;
  }

  bool checkName() {
    final String name = nameController.text;

    final bool isValid = SignUpFormValidator.validateName(name);

    if (isValid) {
      if (state is SignUpStateFailure) {
        emit(
          SignUpStateFailure(
            emailError: (state as SignUpStateFailure).emailError,
            passwordError: (state as SignUpStateFailure).passwordError,
          ),
        );
      } else {
        emit(SignUpStateInitial());
      }
    }
    return isValid;
  }

  bool checkPassword() {
    final String password = passwordController.text;

    final bool isValid = SignUpFormValidator.validatePassword(password);

    if (isValid) {
      if (state is SignUpStateFailure) {
        emit(
          SignUpStateFailure(
            nameError: (state as SignUpStateFailure).nameError,
            emailError: (state as SignUpStateFailure).emailError,
          ),
        );
      } else {
        emit(SignUpStateInitial());
      }
    }
    return isValid;
  }

  bool _checkAllInputs() {
    final bool isNameValid = checkName();
    final bool isEmailValid = checkEmail();
    final bool isPasswordValid = checkPassword();

    final String? nameError =
    isNameValid ? null : 'Name should be longer than 2 symbols.';

    final String? emailError = isEmailValid ? null : 'Invalid email.';

    final String? passwordError =
    isPasswordValid ? null : 'Password should be longer than 7 symbols.';

    if (nameError != null || emailError != null || passwordError != null) {
      emit(
        SignUpStateFailure(
          nameError: nameError,
          emailError: emailError,
          passwordError: passwordError,
        ),
      );
      return false;
    }
    return true;
  }

  Future<void> signUp() async {
    if(!_checkAllInputs()) {
      return;
    }

    emit(SignUpStateLoading());

    final String name = nameController.text;
    final String email = emailController.text;
    final String password = passwordController.text;


    final SignUpParams signUpParams = SignUpParams(
      name: name,
      email: email,
      password: password,
    );

    final Either<Failure, TokenEntity> failureOrToken = await signUpUseCase(
      signUpParams,
    );

    failureOrToken.fold(
      (failure) {
        emit(
          SignUpStateFailure(signUpError: failure.errorMessage),
        );
      },
      (tokenEntity) {
        emit(
          SignUpStateSuccess(accessToken: tokenEntity.token),
        );
      },
    );
  }
}

class SignUpFormValidator {
  SignUpFormValidator._();

  static bool validateEmail(String email) =>
      email.contains('@') && email.length > 4;

  static bool validateName(String name) => name.length >= 3;

  static bool validatePassword(String password) => password.length > 7;
}
