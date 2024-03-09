import 'package:chat_app/features/auth/view/cubit/auth_cubit/auth_cubit.dart';
import 'package:chat_app/features/auth/view/widgets/auth_text_field.dart';
import 'package:chat_app/features/auth/view/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthCubit cubit = context.read<AuthCubit>();
    final AuthState state = context.select((AuthCubit cubit) => cubit.state);

    const double gapBetweenFields = 15;

    return Padding(
      padding: const EdgeInsets.all(34),
      child: Column(
        children: [
          const Text(
            'Login',
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(height: gapBetweenFields),
          AuthTextField(
            text: state.loginParams.email,
            onChanged: cubit.onLoginEmailChanged,
            label: const Text('Email'),
            error: state.loginEmailError == ''
                ? null
                : state.loginEmailError,
          ),
          const SizedBox(height: gapBetweenFields),
          AuthTextField(
            text: state.loginParams.password,
            onChanged: cubit.onLoginPasswordChanged,
            label: const Text('Password'),
            error: state.loginPasswordError == ''
                ? null
                : state.loginPasswordError,
          ),
          const SizedBox(height: gapBetweenFields),
          SubmitButton(
            title: 'Login',
            width: 200,
            height: 60,
            onPressed: cubit.onLoginButton,
            color: Colors.greenAccent,
          ),
        ],
      ),
    );
  }
}
