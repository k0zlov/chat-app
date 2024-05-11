import 'package:flutter/cupertino.dart';

class CupertinoDoneButton extends StatelessWidget {
  const CupertinoDoneButton({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = CupertinoTheme.of(context);

    final textStyle = theme.textTheme.textStyle.copyWith(
      fontWeight: FontWeight.w600,
      color: theme.primaryColor,
      fontSize: 16,
      inherit: false,
    );

    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Text('Done', style: textStyle),
    );
  }
}
