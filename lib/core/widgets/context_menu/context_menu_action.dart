import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class ContextMenuAction extends StatelessWidget {
  const ContextMenuAction({
    super.key,
    required this.title,
    required this.onPressed,
    this.color,
    this.iconData,
    this.destructive = false,
    this.shouldPop = true,
  });

  final bool destructive;
  final bool shouldPop;

  final String title;
  final IconData? iconData;
  final Color? color;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = CupertinoTheme.of(context);

    final textStyle = theme.textTheme.textStyle.copyWith(
      color:
          destructive ? CupertinoColors.destructiveRed.withOpacity(0.7) : color,
    );

    return CupertinoListTile(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
      title: Text(title, style: textStyle),
      trailing: iconData == null
          ? null
          : Icon(
              iconData,
              size: 19,
              color: textStyle.color,
            ),
      onTap: () {
        onPressed();
        if (shouldPop) {
          context.pop();
        }
      },
    );
  }
}
