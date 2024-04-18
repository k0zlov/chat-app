import 'package:chat_app/core/resources/images.dart';
import 'package:chat_app/core/widgets/chat_app_tile/chat_app_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatsListItem extends StatelessWidget {
  const ChatsListItem({
    super.key,
    required this.title,
    this.subtitle,
    this.trailingText,
    this.leading,
    this.pinned = false,
  });

  final String title;
  final String? subtitle;
  final String? trailingText;

  final bool pinned;

  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    final textStyle = CupertinoTheme.of(context).textTheme.textStyle;

    final Color pinnedColor =
        CupertinoTheme.of(context).brightness == Brightness.dark
            ? CupertinoColors.white.withOpacity(0.05)
            : CupertinoColors.black.withOpacity(0.02);

    return ChatAppTile(
      height: 80,
      padding: const EdgeInsets.only(top: 14),
      pressScale: true,
      backgroundColor: pinned ? pinnedColor : Colors.transparent,
      onTap: () {},
      onLongPress: () {},
      leadingSpacing: 80,
      leadingPadding: const EdgeInsets.only(bottom: 6),
      leading: leading ??
          Image.asset(
            AppImages.chat,
          ),
      divider: true,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textStyle.copyWith(
              fontSize: 16,
            ),
          ),
          if (subtitle != null) ...{
            Text(
              subtitle!,
              style: textStyle.copyWith(
                color: CupertinoColors.systemGrey,
              ),
            ),
          },
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (trailingText != null) ...{
            Text(
              trailingText!,
              style: textStyle.copyWith(color: CupertinoColors.systemGrey2),
            ),
          },
          Visibility(
            visible: pinned,
            replacement: const SizedBox(),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Transform.rotate(
                angle: 19.5,
                child: const Icon(
                  CupertinoIcons.pin_fill,
                  size: 17,
                  color: CupertinoColors.inactiveGray,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
