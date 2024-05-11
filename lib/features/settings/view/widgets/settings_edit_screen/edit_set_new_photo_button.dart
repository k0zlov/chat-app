import 'package:flutter/cupertino.dart';

class SettingsEditSetNewPhotoButton extends StatelessWidget {
  const SettingsEditSetNewPhotoButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = CupertinoTheme.of(context);

    final textStyle = theme.textTheme.textStyle.copyWith(
      color: theme.primaryColor,
      fontSize: 15,
      fontWeight: FontWeight.w400,
    );

    return CupertinoButton(
      padding: const EdgeInsets.all(2),
      child: Text('Set New Photo', style: textStyle),
      onPressed: () {},
    );
  }
}
