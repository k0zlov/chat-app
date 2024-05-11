import 'package:flutter/cupertino.dart';

class SettingsSearchButton extends StatelessWidget {
  const SettingsSearchButton({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      child: Icon(
        CupertinoIcons.search,
        color: CupertinoTheme.of(context).primaryColor,
      ),
    );
  }
}
