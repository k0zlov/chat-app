import 'package:flutter/cupertino.dart';

class CupertinoNextButton extends StatelessWidget {
  const CupertinoNextButton({
    super.key,
    required this.onPressed,
    required this.isEnabled,
  });

  final bool isEnabled;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: isEnabled ? onPressed : null,
      child: Text(
        'Next',
        style: TextStyle(
          color: isEnabled ? null : CupertinoColors.inactiveGray,
        ),
      ),
    );
  }
}
