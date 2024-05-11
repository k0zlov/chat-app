import 'package:chat_app/features/settings/view/widgets/settings_text_option.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

class SettingsEditBioSection extends StatelessWidget {
  const SettingsEditBioSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = CupertinoTheme.of(context);

    final textStyle = theme.textTheme.textStyle.copyWith(
      fontSize: 12,
      color: CupertinoColors.systemGrey.withOpacity(0.6),
    );

    return CupertinoListSection.insetGrouped(
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
        SettingsTextOption(
          text: '',
          onChanged: (_) {},
          placeholder: 'Bio',
        ),
      ],
    );
  }
}
