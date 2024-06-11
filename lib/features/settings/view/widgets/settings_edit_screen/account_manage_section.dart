import 'package:chat_app/features/auth/view/cubit/auth_cubit.dart';
import 'package:chat_app/features/settings/view/widgets/settings_options_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsEditAccountManageSection extends StatelessWidget {
  const SettingsEditAccountManageSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = CupertinoTheme.of(context);

    final textStyle = theme.textTheme.textStyle.copyWith(
      fontSize: 14,
      color: CupertinoColors.systemGrey.withOpacity(0.6),
    );

    final AuthState authState = context.select(
      (AuthCubit cubit) => cubit.state,
    );

    return CupertinoListSection.insetGrouped(
      dividerMargin: 0,
      additionalDividerMargin: 15,
      backgroundColor: Colors.transparent,
      children: [
        SettingsOptionsItem(
          title: 'Change email',
          trailing: Text(
            authState.currentUser.email,
            style: textStyle,
          ),
          onPressed: () {},
        ),
        SettingsOptionsItem(
          title: 'Username',
          trailing: Text('@tagname', style: textStyle),
          onPressed: () {},
        ),
        SettingsOptionsItem(
          title: 'Your color',
          onPressed: () {},
        ),
      ],
    );
  }
}
