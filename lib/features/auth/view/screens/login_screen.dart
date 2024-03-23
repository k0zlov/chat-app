import 'package:chat_app/core/navigation/navigation.dart';
import 'package:chat_app/core/widgets/blur/blurred_loading_screen.dart';
import 'package:chat_app/core/widgets/buttons/cupertino_submit_button.dart';
import 'package:chat_app/core/widgets/modal_pop_up.dart';
import 'package:chat_app/features/auth/view/cubit/auth_cubit.dart';
import 'package:chat_app/features/auth/view/widgets/auth_text_field.dart';
import 'package:chat_app/features/auth/view/widgets/hide_password_button.dart';
import 'package:chat_app/features/auth/view/widgets/info_page.dart';
import 'package:chat_app/utils/text_input_validator/text_input_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool loading =
        context.select((AuthCubit cubit) => cubit.state).authInProcess;

    return CupertinoPageScaffold(
      child: loading
          ? const BlurredBackgroundLoading(
              backgroundWidget: _LoadingScreenBody(),
            )
          : const _LoadingScreenBody(),
    );
  }
}

class _LoadingScreenBody extends StatelessWidget {
  const _LoadingScreenBody();

  @override
  Widget build(BuildContext context) {
    final AuthInfoPageData loginPageData = AuthInfoPageData(
      header: Image.asset(
        'assets/images/login.png',
        height: 80,
        width: 80,
      ),
      description: [
        '',
        'Please enter your credentials to login.',
      ],
      label: 'Login',
    );

    final AuthCubit cubit = context.read<AuthCubit>();
    final AuthState state = context.select((AuthCubit cubit) => cubit.state);

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.authError != '') {
          showCupertinoModalPopup<bool>(
            context: context,
            builder: (context) {
              return ModalPopUpContainer(
                iconData: CupertinoIcons.exclamationmark_triangle_fill,
                message: state.authError,
              );
            },
          );
          cubit.clearAuthError();
        }
      },
      child: CupertinoScrollbar(
        child: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom / 10,
              top: MediaQuery.of(context).size.height / 5,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AuthInfoPage(
                    pageData: loginPageData,
                    headerPadding: 0,
                  ),
                  const SizedBox(height: 30),
                  AuthTextField(
                    onChanged: cubit.onLoginEmail,
                    text: state.loginParams.email,
                    placeholder: 'Email',
                    validator: (value) {
                      return TextInputValidator.validateEmail(value ?? '');
                    },
                    prefix: const Icon(
                      CupertinoIcons.mail,
                      color: CupertinoColors.inactiveGray,
                    ),
                  ),
                  const SizedBox(height: 15),
                  AuthTextField(
                    onChanged: cubit.onLoginPassword,
                    text: state.loginParams.password,
                    obscureText: state.hidePassword,
                    placeholder: 'Password',
                    prefix: const AuthHidePasswordButton(),
                  ),
                  const SizedBox(height: 20),
                  CupertinoSubmitButton(
                    horizontalPadding: 0,
                    label: 'Continue',
                    onPressed:
                        cubit.checkLoginParams() ? cubit.onLoginButton : null,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "I don't have an account.",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      CupertinoButton(
                        color: Colors.transparent,
                        onPressed: () =>
                            context.go(AppRoutes.registration.path),
                        padding: const EdgeInsets.only(left: 5),
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 14,
                            color: CupertinoColors.activeGreen,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
