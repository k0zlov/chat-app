import 'package:chat_app/core/widgets/blurred_background.dart';
import 'package:chat_app/features/auth/view/cubit/auth_cubit/auth_cubit.dart';
import 'package:chat_app/features/auth/view/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.authError != '') {
          context.read<AuthCubit>().showAuthError(context);
        }
      },
      builder: (context, state) {
        return state.authInProcess
            ? const _LoadingLoginScreen()
            : const _LoginScreenStructure();
      },
    );
  }
}

class _LoadingLoginScreen extends StatelessWidget {
  const _LoadingLoginScreen();

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        IgnorePointer(child: _LoginScreenStructure()),
        BlurredBackground(
          blurAmount: 3,
          child: Center(child: CircularProgressIndicator()),
        ),
      ],
    );
  }
}

class _LoginScreenStructure extends StatelessWidget {
  const _LoginScreenStructure();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: LoginForm(),
        ),
      ),
    );
  }
}
