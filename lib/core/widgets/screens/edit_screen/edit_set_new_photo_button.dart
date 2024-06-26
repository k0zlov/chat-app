import 'package:flutter/cupertino.dart';

class EditScreenSetNewPhotoButton extends StatelessWidget {
  const EditScreenSetNewPhotoButton({
    super.key,
    required this.onPressed,
  });

  final void Function()? onPressed;

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
      onPressed: onPressed,
      child: Text('Set New Photo', style: textStyle),
    );
  }
}
