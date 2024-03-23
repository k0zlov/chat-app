import 'package:chat_app/features/auth/view/cubit/auth_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthHidePasswordButton extends StatelessWidget {
  const AuthHidePasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthCubit cubit = context.read<AuthCubit>();
    final AuthState state = context.select((AuthCubit cubit) => cubit.state);

    return CupertinoButton(
      minSize: 25,
      padding: EdgeInsetsDirectional.zero,
      onPressed: cubit.onHidePassword,
      child: Icon(
        state.hidePassword
            ? CupertinoIcons.eye_slash_fill
            : CupertinoIcons.eye_fill,
        color: CupertinoColors.inactiveGray,
      ),
    );
  }
}
