import 'package:chat_app/core/resources/images.dart';
import 'package:chat_app/core/widgets/buttons/pressable_scale_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatsListItem extends StatelessWidget {
  const ChatsListItem({
    super.key,
    required this.title,
    required this.onPressed,
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

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final Color pinnedColor =
        CupertinoTheme.of(context).brightness == Brightness.dark
            ? CupertinoColors.white.withOpacity(0.05)
            : CupertinoColors.black.withOpacity(0.02);

    return PressableScaleWidget(
      child: CupertinoListTile(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        backgroundColor: pinned ? pinnedColor : Colors.transparent,
        leadingSize: 60,
        onTap: onPressed,
        leading: leading ??
            Image.asset(
              AppImages.chat,
            ),
        title: _ChatsListItemTitle(
          title: title,
          subtitle: subtitle,
        ),
        trailing: _ChatsListItemTrailing(
          pinned: pinned,
          trailingText: trailingText,
        ),
      ),
    );
  }
}

class _ChatsListItemTitle extends StatelessWidget {
  const _ChatsListItemTitle({
    required this.title,
    this.subtitle,
  });

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final textStyle = CupertinoTheme.of(context).textTheme.textStyle;

    return Column(
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
    );
  }
}

class _ChatsListItemTrailing extends StatelessWidget {
  const _ChatsListItemTrailing({
    required this.pinned,
    this.trailingText,
  });

  final String? trailingText;
  final bool pinned;

  @override
  Widget build(BuildContext context) {
    final textStyle = CupertinoTheme.of(context).textTheme.textStyle;

    return Column(
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
    );
  }
}
