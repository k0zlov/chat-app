import 'package:chat_app/features/settings/view/widgets/settings_text_option.dart';
import 'package:flutter/cupertino.dart';

class SettingsEditNameSection extends StatelessWidget {
  const SettingsEditNameSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = CupertinoTheme.of(context);

    final textStyle = theme.textTheme.textStyle.copyWith(
      fontSize: 12,
      color: CupertinoColors.systemGrey.withOpacity(0.6),
    );

    return CupertinoListSection.insetGrouped(
      dividerMargin: 0,
      additionalDividerMargin: 15,
      footer: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Text(
          'Enter your name and add an optional profile photo.',
          style: textStyle,
        ),
      ),
      children: [
        SettingsTextOption(
          text: '',
          onChanged: (_) {},
          placeholder: 'First Name',
        ),
        SettingsTextOption(
          text: '',
          onChanged: (_) {},
          placeholder: 'Last Name',
        ),
      ],
    );
  }
}
