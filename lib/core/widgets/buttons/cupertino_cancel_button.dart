import 'package:flutter/cupertino.dart';

class CupertinoCancelButton extends StatelessWidget {
  const CupertinoCancelButton({
    super.key,
    required this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = CupertinoTheme.of(context);

    final textStyle = theme.textTheme.textStyle.copyWith(
      fontWeight: FontWeight.w400,
      color: theme.primaryColor,
      fontSize: 16,
    );


    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Text('Cancel', style: textStyle),
    );
  }
}
