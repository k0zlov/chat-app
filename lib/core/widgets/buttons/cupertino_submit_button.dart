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
    final Color primaryColor = CupertinoTheme.of(context).primaryColor;

    final Color primaryContrast =
        CupertinoTheme.of(context).primaryContrastingColor;

    final bool buttonEnabled = onPressed != null;

    final Color buttonTextColor = buttonEnabled
        ? textColor ?? primaryContrast
        : CupertinoColors.inactiveGray;

    return SizedBox(
      width: width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: CupertinoButton(
          borderRadius: BorderRadius.circular(15),
          onPressed: onPressed,
          color: color ?? primaryColor,
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
