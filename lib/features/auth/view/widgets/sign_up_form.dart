import 'package:chat_app/features/auth/view/cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:chat_app/features/auth/view/widgets/input_field.dart';
import 'package:chat_app/features/auth/view/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        String? nameError;
        String? emailError;
        String? passwordError;

        if (state is SignUpStateFailure) {
          nameError = state.nameError;
          emailError = state.emailError;
          passwordError = state.passwordError;
        }
        final SignUpCubit cubit = context.read<SignUpCubit>();

        return Column(
          children: [
            const Text('Sign Up', style: TextStyle(fontSize: 30)),
            const SizedBox(height: 10),
            InputField(
              title: 'Name',
              controller: cubit.nameController,
              errorText: nameError,
              onChanged: cubit.checkName,
            ),
            const SizedBox(height: 10),
            InputField(
              title: 'Email',
              controller: cubit.emailController,
              errorText: emailError,
              onChanged: cubit.checkEmail,
            ),
            const SizedBox(height: 10),
            InputField(
              title: 'Password',
              controller: cubit.passwordController,
              errorText: passwordError,
              onChanged: cubit.checkPassword,
            ),
            const SizedBox(height: 10),
            SubmitButton(
              title: 'Sign up',
              color: Colors.greenAccent,
              width: 200,
              height: 60,
              onPressed: () async {
                return cubit.signUp();
              },
            ),
          ],
        );
      },
    );
  }
}
