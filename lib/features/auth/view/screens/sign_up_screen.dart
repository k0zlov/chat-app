import 'package:chat_app/core/navigation/navigation.dart';
import 'package:chat_app/features/auth/view/cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:chat_app/features/auth/view/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpStateSuccess) {
          // final String accessToken = state.accessToken;
          context.go(AppRoutes.chats.path);
        }
        if (state is SignUpStateFailure) {
          if (state.signUpError != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.signUpError!),
              ),
            );
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(30),
            child: Center(
              child: state is SignUpStateLoading
                  ? const CircularProgressIndicator()
                  : const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SignUpForm(),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}
