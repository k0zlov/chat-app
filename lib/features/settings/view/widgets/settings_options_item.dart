import 'package:flutter/cupertino.dart';

class SettingsOptionsItem extends StatelessWidget {
  const SettingsOptionsItem({
    super.key,
    required this.title,
    required this.onPressed,
    this.leading,
    this.textColor,
    this.trailing,
    this.trailingArrow = true,
  });

  final String title;

  final Widget? leading;
  final Widget? trailing;

  final bool trailingArrow;

  final Color? textColor;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final textStyle = CupertinoTheme.of(context).textTheme.textStyle.copyWith(
          color: textColor,
        );

    return CupertinoListTile(
      leading: leading,
      onTap: onPressed,
      title: Text(title, style: textStyle),
      trailing: Row(
        children: [
          trailing ?? const SizedBox(),
          if (trailingArrow) ...{
            const CupertinoListTileChevron(),
          },
        ],
      ),
    );
  }
}
