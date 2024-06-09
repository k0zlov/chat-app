import 'dart:async';

import 'package:chat_app/core/widgets/buttons/pressable_scale_widget.dart';
import 'package:flutter/cupertino.dart';

class ContactsListItem extends StatefulWidget {
  const ContactsListItem({
    required this.title,
    required this.onPressed,
    this.lastActivity,
    super.key,
    this.leading,
    this.pressable = true,
    this.showStatus = true,
    this.backgroundColor,
    this.titleColor,
  });

  final Widget? leading;

  final String title;
  final DateTime? lastActivity;

  final bool pressable;
  final bool showStatus;

  final Color? backgroundColor;
  final Color? titleColor;

  final void Function() onPressed;

  @override
  State<ContactsListItem> createState() => _ContactsListItemState();
}

class _ContactsListItemState extends State<ContactsListItem> {
  late Timer _timer;
  late DateTime _currentTime;

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool online;
    final String? subtitle;

    if (widget.lastActivity != null) {
      final Duration difference = _currentTime.difference(widget.lastActivity!);

      if (difference.inMinutes <= 5) {
        online = true;
        subtitle = null;
      } else {
        online = false;
        subtitle = 'last seen ${difference.inMinutes} min ago';
      }
    } else {
      online = false;
      subtitle = 'last seen recently';
    }

    final contactWidget = CupertinoListTile(
      leadingSize: 50,
      onTap: widget.onPressed,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      backgroundColor: widget.backgroundColor ??
          CupertinoTheme.of(context).barBackgroundColor,
      leading: widget.leading ??
          const Icon(
            CupertinoIcons.profile_circled,
            size: 38,
            color: CupertinoColors.inactiveGray,
          ),
      title: _ContactsListItemTitle(
        online: online,
        title: widget.title,
        subtitle: widget.showStatus ? subtitle : null,
        titleColor: widget.titleColor,
      ),
    );

    return widget.pressable
        ? PressableScaleWidget(
            child: contactWidget,
          )
        : contactWidget;
  }
}

class _ContactsListItemTitle extends StatelessWidget {
  const _ContactsListItemTitle({
    required this.online,
    required this.title,
    required this.subtitle,
    this.titleColor,
  });

  final bool online;

  final String title;
  final String? subtitle;

  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    final textStyle = CupertinoTheme.of(context).textTheme.textStyle;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: textStyle.copyWith(color: titleColor)),
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
