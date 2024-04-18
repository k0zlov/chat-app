import 'package:chat_app/core/resources/palette.dart';
import 'package:chat_app/core/widgets/chat_app_tile/chat_app_tile.dart';
import 'package:flutter/cupertino.dart';

class SettingsOptionsItem extends StatelessWidget {
  const SettingsOptionsItem({
    super.key,
    required this.title,
    required this.divider,
    required this.roundedTopBorder,
    required this.roundedBottomBorder,
    required this.onPressed,
    this.leading,
    this.textColor,
    this.trailing,
    this.trailingArrow = true,
    this.padding = const EdgeInsets.only(bottom: 16),
  });

  final String title;

  final Widget? leading;
  final Widget? trailing;

  final bool divider;
  final bool roundedTopBorder;
  final bool roundedBottomBorder;
  final bool trailingArrow;

  final Color? textColor;

  final EdgeInsets padding;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor =
        CupertinoTheme.of(context).brightness == Brightness.dark
            ? AppPalette.darkMenuOptionBackground
            : AppPalette.lightMenuOptionBackground;

    final textStyle = CupertinoTheme.of(context).textTheme.textStyle.copyWith(
          color: textColor,
        );

    return ChatAppTile(
      title: Padding(
        padding: const EdgeInsets.only(left: 14),
        child: Text(
          title,
          style: textStyle,
        ),
      ),
      trailing: trailing,
      trailingArrow: trailingArrow,
      onTap: onPressed,
      bodyPadding: padding,
      leading: leading,
      backgroundColor: backgroundColor,
      leadingPadding: const EdgeInsets.only(left: 8, bottom: 8),
      divider: divider,
      roundedTopBorder: roundedTopBorder,
      roundedBottomBorder: roundedBottomBorder,
    );
  }
}