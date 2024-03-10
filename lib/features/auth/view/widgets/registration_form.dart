import 'package:chat_app/core/navigation/navigation.dart';
import 'package:chat_app/features/auth/view/cubit/auth_cubit/auth_cubit.dart';
import 'package:chat_app/features/auth/view/widgets/auth_text_field.dart';
import 'package:chat_app/features/auth/view/widgets/hide_password_button.dart';
import 'package:chat_app/features/auth/view/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({super.key});

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
            'Sign Up',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text('Create your account'),
          const SizedBox(height: gapBetweenFields),
          AuthTextField(
            text: state.registrationParams.name,
            onChanged: cubit.onRegistrationNameChanged,
            label: const Text('Name'),
            prefixIcon: const Icon(Icons.person),
            helperText: 'Name should be at least 2 symbols long.',
            error: state.registrationNameError == ''
                ? null
                : state.registrationNameError,
          ),
          const SizedBox(height: gapBetweenFields),
          AuthTextField(
            text: state.registrationParams.email,
            onChanged: cubit.onRegistrationEmailChanged,
            label: const Text('Email'),
            prefixIcon: const Icon(Icons.email),
            error: state.registrationEmailError == ''
                ? null
                : state.registrationEmailError,
          ),
          const SizedBox(height: gapBetweenFields),
          AuthTextField(
            obscureText: state.hidePassword,
            text: state.registrationParams.password,
            onChanged: cubit.onRegistrationPasswordChanged,
            label: const Text('Password'),
            suffixIcon: const AuthHidePasswordButton(),
            helperText: 'Password should be longer than 7 symbols.',
            error: state.registrationPasswordError == ''
                ? null
                : state.registrationPasswordError,
          ),
          const SizedBox(height: gapBetweenFields),
          SubmitButton(
            title: 'Sign Up',
            width: 200,
            height: 60,
            onPressed: cubit.onRegistrationButton,
            color: Colors.greenAccent,
          ),
          const SizedBox(height: gapBetweenFields),
          TextButton(
            onPressed: () => context.go(AppRoutes.login.path),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(color: Colors.black,fontSize: 14),
                ),
                SizedBox(width: 4),
                Text(
                  'Sign in',
                  style: TextStyle(color: Colors.blueAccent, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
