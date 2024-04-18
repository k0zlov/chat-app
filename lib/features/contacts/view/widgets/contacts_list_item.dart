import 'package:chat_app/core/widgets/buttons/pressable_scale_widget.dart';
import 'package:flutter/cupertino.dart';

class ContactsListItem extends StatelessWidget {
  const ContactsListItem({
    required this.title,
    required this.onPressed,
    super.key,
    this.leading,
    this.subtitle,
    this.online = false,
    this.backgroundColor,
  });

  final Widget? leading;

  final String title;
  final String? subtitle;

  final bool online;

  final Color? backgroundColor;

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return PressableScaleWidget(
      child: CupertinoListTile(
        leadingSize: 50,
        onTap: onPressed,
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        backgroundColor: backgroundColor ??
            CupertinoTheme.of(context).scaffoldBackgroundColor,
        leading: leading ??
            const Icon(
              CupertinoIcons.profile_circled,
              size: 38,
              color: CupertinoColors.inactiveGray,
            ),
        title: _ContactsListItemTitle(
          online: online,
          title: title,
          subtitle: subtitle,
        ),
      ),
    );
  }
}

class _ContactsListItemTitle extends StatelessWidget {
  const _ContactsListItemTitle({
    required this.online,
    required this.title,
    required this.subtitle,
  });

  final bool online;

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final textStyle = CupertinoTheme.of(context).textTheme.textStyle;

    return Column(
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
    );
  }
}
