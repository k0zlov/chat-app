import 'package:chat_app/features/auth/view/cubit/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthHidePasswordButton extends StatelessWidget {
  const AuthHidePasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthCubit cubit = context.read<AuthCubit>();
    final AuthState state = context.select((AuthCubit cubit) => cubit.state);

    return IconButton(
      onPressed: cubit.onHidePasswordButton,
      icon: Icon(state.hidePassword ? Icons.visibility_off : Icons.visibility),
    );
  }
}
