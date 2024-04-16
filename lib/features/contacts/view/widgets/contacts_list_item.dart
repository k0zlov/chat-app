import 'package:chat_app/core/widgets/chat_app_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactsListItem extends StatelessWidget {
  const ContactsListItem({
    super.key,
    required this.title,
    required this.hasDivider,
    this.leading,
    this.subtitle,
    this.padding = EdgeInsets.zero,
    this.backgroundColor = Colors.transparent,
  });

  final Widget? leading;
  final String title;
  final String? subtitle;
  final bool hasDivider;
  final EdgeInsets padding;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ChatAppTile(
      hasDivider: hasDivider,
      trailingArrow: false,
      backgroundColor: backgroundColor,
      title: title,
      leading: leading ??
          const Icon(
            CupertinoIcons.profile_circled,
            size: 38,
            color: CupertinoColors.inactiveGray,
          ),
      subtitle: subtitle,
      height: 58,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      leadingPadding: padding,
      hasTopBorder: false,
      hasBottomBorder: false,
      onPressed: () {},
    );
  }
}
