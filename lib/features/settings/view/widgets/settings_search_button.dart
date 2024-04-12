import 'package:flutter/cupertino.dart';

class SettingsSearchButton extends StatelessWidget {
  const SettingsSearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {},
      child: Icon(
        CupertinoIcons.search,
        color: CupertinoTheme.of(context).primaryColor,
      ),
    );
  }
}
