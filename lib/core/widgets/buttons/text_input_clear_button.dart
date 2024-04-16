import 'package:flutter/cupertino.dart';

class TextInputClearButton extends StatelessWidget {
  const TextInputClearButton({
    super.key,
    required this.onPressed,
    this.padding = EdgeInsets.zero,
  });

  final EdgeInsets padding;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: CupertinoButton(
        child: const Icon(
          CupertinoIcons.clear_circled_solid,
          size: 18,
          color: CupertinoColors.systemGrey,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
