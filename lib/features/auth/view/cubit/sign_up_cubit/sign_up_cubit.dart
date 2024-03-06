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

  Future<void> signUp() async {
    final String name = nameController.text;
    final String email = emailController.text;
    final String password = passwordController.text;

    final String? nameError = SignUpFormValidator.validateName(name)
        ? null
        : 'Name should be longer than 2 symbols.';

    final String? emailError =
        SignUpFormValidator.validateEmail(email) ? null : 'Invalid email.';

    final String? passwordError = SignUpFormValidator.validatePassword(password)
        ? null
        : 'Password should be longer than 7 symbols.';

    if (nameError != null || emailError != null || passwordError != null) {
      emit(
        SignUpStateFailure(
          nameError: nameError,
          emailError: emailError,
          passwordError: passwordError,
        ),
      );
      return;
    }

    emit(SignUpStateLoading());

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
