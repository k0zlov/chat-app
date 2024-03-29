import 'package:chat_app/core/navigation/navigation.dart';
import 'package:chat_app/core/resources/images.dart';
import 'package:chat_app/core/widgets/blur/blurred_loading_screen.dart';
import 'package:chat_app/core/widgets/buttons/cupertino_submit_button.dart';
import 'package:chat_app/features/auth/view/cubit/auth_cubit.dart';
import 'package:chat_app/features/auth/view/widgets/auth_text_field.dart';
import 'package:chat_app/features/auth/view/widgets/hide_password_button.dart';
import 'package:chat_app/features/auth/view/widgets/info_page.dart';
import 'package:chat_app/utils/text_input_validator/text_input_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool loading =
        context.select((AuthCubit cubit) => cubit.state).authInProcess;

    return CupertinoPageScaffold(
      child: loading
          ? const BlurredBackgroundLoading(
              backgroundWidget: _RegistrationScreenBody(),
            )
          : const _RegistrationScreenBody(),
    );
  }
}

class _RegistrationScreenBody extends StatelessWidget {
  const _RegistrationScreenBody();

  @override
  Widget build(BuildContext context) {
    final AuthInfoPageData registrationPageData = AuthInfoPageData(
      header: Image.asset(
        AppImages.registration,
        height: 80,
        width: 80,
      ),
      description: [
        '',
        'Please enter your credentials to register.',
      ],
      label: 'Sign Up',
    );

    final AuthCubit cubit = context.read<AuthCubit>();
    final AuthState state = context.select((AuthCubit cubit) => cubit.state);

    return CupertinoScrollbar(
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
                  pageData: registrationPageData,
                  headerPadding: 0,
                ),
                const SizedBox(height: 30),
                AuthTextField(
                  placeholder: 'Name',
                  onChanged: cubit.onRegistrationName,
                  text: state.registrationParams.name,
                  validator: (value) {
                    return TextInputValidator.validateName(value ?? '');
                  },
                  prefix: const Icon(
                    CupertinoIcons.profile_circled,
                    color: CupertinoColors.inactiveGray,
                  ),
                ),
                const SizedBox(height: 4),
                AuthTextField(
                  placeholder: 'Email',
                  onChanged: cubit.onRegistrationEmail,
                  text: state.registrationParams.email,
                  validator: (value) {
                    return TextInputValidator.validateEmail(value ?? '');
                  },
                  prefix: const Icon(
                    CupertinoIcons.mail,
                    color: CupertinoColors.inactiveGray,
                  ),
                ),
                const SizedBox(height: 4),
                AuthTextField(
                  placeholder: 'Password',
                  obscureText: state.hidePassword,
                  onChanged: cubit.onRegistrationPassword,
                  text: state.registrationParams.password,
                  validator: (value) {
                    return TextInputValidator.validatePassword(value ?? '');
                  },
                  prefix: const AuthHidePasswordButton(),
                ),
                const SizedBox(height: 20),
                CupertinoSubmitButton(
                  label: 'Continue',
                  horizontalPadding: 0,
                  onPressed: cubit.checkRegistrationParams()
                      ? cubit.onRegistrationButton
                      : null,
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'I already have an account.',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    CupertinoButton(
                      color: Colors.transparent,
                      onPressed: () => context.go(AppRoutes.login.path),
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 14,
                          color: CupertinoTheme.of(context).primaryColor,
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
    );
  }
}
