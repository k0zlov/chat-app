import 'package:chat_app/core/widgets/buttons/pressable_scale_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatsListItem extends StatelessWidget {
  const ChatsListItem({
    super.key,
    required this.title,
    required this.onPressed,
    this.draftText = '',
    this.subtitle,
    this.trailingText,
    this.leading,
    this.pinned = false,
  });

  final String title;
  final String? subtitle;
  final String? trailingText;
  final String draftText;

  final bool pinned;

  final Widget? leading;

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final Color pinnedColor =
        CupertinoTheme.of(context).brightness == Brightness.dark
            ? CupertinoColors.white.withOpacity(0.05)
            : CupertinoColors.black.withOpacity(0.02);

    final textStyle = CupertinoTheme.of(context).textTheme.textStyle.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 30,
          color: CupertinoColors.white,
        );

    return PressableScaleWidget(
      child: CupertinoListTile(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        backgroundColor: pinned ? pinnedColor : Colors.transparent,
        leadingSize: 60,
        onTap: onPressed,
        leading: leading ??
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: CupertinoColors.activeOrange,
                borderRadius: BorderRadius.circular(100),
              ),
              alignment: Alignment.center,
              child: Text(title.substring(0, 1), style: textStyle),
            ),
        title: _ChatsListItemTitle(
          title: title,
          subtitle: subtitle,
          draftText: draftText,
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
    required this.draftText,
    this.subtitle,
  });

  final String title;
  final String draftText;
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
        if (draftText.isNotEmpty) ...{
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Draft: ',
                  style: textStyle.copyWith(color: CupertinoColors.systemRed),
                ),
                TextSpan(
                  text: draftText,
                  style: textStyle.copyWith(
                    color: CupertinoColors.systemGrey,
                  ),
                ),
              ],
            ),
          ),
        } else if (subtitle != null) ...{
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
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Visibility(
            visible: pinned,
            replacement: const SizedBox(width: 17, height: 17),
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
