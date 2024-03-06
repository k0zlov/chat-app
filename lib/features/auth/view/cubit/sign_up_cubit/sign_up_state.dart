part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpState {}

class SignUpStateInitial extends SignUpState {}

class SignUpStateLoading extends SignUpState {}

class SignUpStateSuccess extends SignUpState {
  SignUpStateSuccess({
    required this.accessToken,
  });

  final String accessToken;
}

class SignUpStateFailure extends SignUpState {
  SignUpStateFailure({
    this.nameError,
    this.emailError,
    this.passwordError,
    this.signUpError,
  });

  final String? nameError;
  final String? emailError;
  final String? passwordError;

  final String? signUpError;

  SignUpStateFailure copyWith({
    String? nameError,
    String? emailError,
    String? passwordError,
    String? signUpError,
  }) {
    return SignUpStateFailure(
      nameError: nameError ?? this.nameError,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      signUpError: signUpError ?? this.signUpError,
    );
  }
}
