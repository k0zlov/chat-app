import 'package:chat_app/features/auth/auth_feature.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsEditAuthActionsSection extends StatelessWidget {
  const SettingsEditAuthActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = CupertinoTheme.of(context);

    final textStyle = theme.textTheme.textStyle.copyWith(
      fontSize: 12,
      color: CupertinoColors.systemGrey.withOpacity(0.6),
    );

    final AuthCubit cubit = context.read<AuthCubit>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CupertinoListSection.insetGrouped(
          footer: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              'You can connect multiply accounts with different emails.',
              style: textStyle,
            ),
          ),
          children: [
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                child: const Text('Add Another Account'),
                onPressed: () {},
              ),
            ),
          ],
        ),
        CupertinoListSection.insetGrouped(
          children: [
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: cubit.logout,
                child: Text(
                  'Log Out',
                  style: textStyle.copyWith(
                    color: CupertinoColors.systemRed,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
