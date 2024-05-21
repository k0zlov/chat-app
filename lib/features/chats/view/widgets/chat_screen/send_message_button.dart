import 'package:flutter/cupertino.dart';

class SendMessageButton extends StatelessWidget {
  const SendMessageButton({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      borderRadius: BorderRadius.circular(30),
      color: CupertinoTheme.of(context).primaryColor,
      minSize: 35,
      child: const Icon(
        CupertinoIcons.arrow_up,
        size: 28,
        color: CupertinoColors.white,
      ),
    );
  }
}