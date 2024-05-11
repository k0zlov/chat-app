import 'package:chat_app/features/settings/view/widgets/settings_options_item.dart';
import 'package:flutter/cupertino.dart';

class SettingsEditAccountManageSection extends StatelessWidget {
  const SettingsEditAccountManageSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = CupertinoTheme.of(context);

    final textStyle = theme.textTheme.textStyle.copyWith(
      fontSize: 14,
      color: CupertinoColors.systemGrey.withOpacity(0.6),
    );

    return CupertinoListSection.insetGrouped(
      dividerMargin: 0,
      additionalDividerMargin: 15,
      children: [
        SettingsOptionsItem(
          title: 'Change email',
          trailing: Text('example@gmail.com', style: textStyle),
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
