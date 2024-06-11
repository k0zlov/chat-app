import 'package:chat_app/core/widgets/screens/edit_screen/edit_text_option.dart';
import 'package:chat_app/features/auth/view/cubit/auth_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsEditBioSection extends StatelessWidget {
  const SettingsEditBioSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = CupertinoTheme.of(context);

    final textStyle = theme.textTheme.textStyle.copyWith(
      fontSize: 12,
      color: CupertinoColors.systemGrey.withOpacity(0.6),
    );

    final AuthCubit authCubit = context.read<AuthCubit>();

    final AuthState authState = context.select(
      (AuthCubit cubit) => cubit.state,
    );

    return CupertinoListSection.insetGrouped(
      backgroundColor: Colors.transparent,
      footer: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: RichText(
          text: TextSpan(
            style: textStyle,
            children: [
              const TextSpan(
                text:
                    'You can add a few lines about yourself. Choose who can see your bio in',
              ),
              TextSpan(
                style: textStyle.copyWith(color: theme.primaryColor),
                text: ' Settings',
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
              const TextSpan(text: '.'),
            ],
          ),
        ),
      ),
      children: [
        EditScreenTextOption(
          text: authState.updateUserParams.bio ?? '',
          onChanged: authCubit.onUpdateBio,
          placeholder: 'Bio',
        ),
      ],
    );
  }
}
