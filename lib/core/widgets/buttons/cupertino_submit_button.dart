import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoSubmitButton extends StatelessWidget {
  const CupertinoSubmitButton({
    super.key,
    required this.label,
    this.color,
    this.textColor,
    this.width = double.infinity,
    this.onPressed,
    this.horizontalPadding = 20,
  });

  final String label;
  final Color? color;
  final Color? textColor;
  final double? width;
  final double horizontalPadding;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final bool buttonEnabled = onPressed != null;

    final Color buttonTextColor = buttonEnabled
        ? textColor ?? CupertinoColors.white
        : CupertinoColors.inactiveGray;

    final Color? defaultButtonColor = Colors.green[700];

    return SizedBox(
      width: width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: CupertinoButton(
          borderRadius: BorderRadius.circular(15),
          onPressed: onPressed,
          color: color ?? defaultButtonColor,
          child: Text(
            label,
            style: TextStyle(
              color: buttonTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
