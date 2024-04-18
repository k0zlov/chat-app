import 'package:chat_app/core/widgets/chat_app_tile/chat_app_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactsListItem extends StatelessWidget {
  const ContactsListItem({
    super.key,
    required this.title,
    this.leading,
    this.subtitle,
    this.divider = false,
    this.online = false,
    this.backgroundColor = Colors.transparent,
  });

  final Widget? leading;

  final String title;
  final String? subtitle;

  final bool online;
  final bool divider;

  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final textStyle = CupertinoTheme.of(context).textTheme.textStyle;

    return ChatAppTile(
      onTap: () {},
      onLongPress: () {},
      pressScale: true,
      divider: divider,
      leadingSpacing: 50,
      backgroundColor: backgroundColor,
      leading: leading ??
          const Icon(
            CupertinoIcons.profile_circled,
            size: 38,
            color: CupertinoColors.inactiveGray,
          ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          if (online || subtitle != null) ...{
            Text(
              online ? 'online' : subtitle ?? '',
              style: textStyle.copyWith(
                fontSize: 12,
                color: online
                    ? CupertinoColors.activeGreen
                    : CupertinoColors.inactiveGray,
              ),
            ),
          },
        ],
      ),
    );
  }
}
