import 'package:chat_app/core/widgets/screens/edit_screen/edit_text_option.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      backgroundColor: Colors.transparent,
      footer: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Text(
          'Enter your name and add an optional profile photo.',
          style: textStyle,
        ),
      ),
      children: [
        EditScreenTextOption(
          text: '',
          onChanged: (_) {},
          placeholder: 'First Name',
        ),
        EditScreenTextOption(
          text: '',
          onChanged: (_) {},
          placeholder: 'Last Name',
        ),
      ],
    );
  }
}
