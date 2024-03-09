import 'package:chat_app/core/widgets/blurred_background.dart';
import 'package:chat_app/features/auth/view/cubit/auth_cubit/auth_cubit.dart';
import 'package:chat_app/features/auth/view/widgets/registration_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthState state = context.select((AuthCubit cubit) => cubit.state);

    return state.authInProcess
        ? const _LoadingRegistrationScreen()
        : const _RegistrationScreenStructure();
  }
}

class _LoadingRegistrationScreen extends StatelessWidget {
  const _LoadingRegistrationScreen();

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        IgnorePointer(child: _RegistrationScreenStructure()),
        BlurredBackground(
          blurAmount: 3,
          child: Center(child: CircularProgressIndicator()),
        ),
      ],
    );
  }
}

class _RegistrationScreenStructure extends StatelessWidget {
  const _RegistrationScreenStructure();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: RegistrationForm(),
        ),
      ),
    );
  }
}
