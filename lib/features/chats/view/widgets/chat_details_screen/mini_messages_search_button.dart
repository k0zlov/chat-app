import 'package:flutter/cupertino.dart';

class MiniMessagesSearchButton extends StatelessWidget {
  const MiniMessagesSearchButton({
    required this.onPressed,
    super.key,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      onPressed: onPressed,
      child: const Icon(CupertinoIcons.search),
    );
  }
}
