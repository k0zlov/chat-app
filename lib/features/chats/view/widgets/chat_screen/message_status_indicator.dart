import 'package:flutter/cupertino.dart';

enum MessageStatus {
  pending,
  sent,
  seen,
}

class MessageStatusIndicator extends StatelessWidget {
  const MessageStatusIndicator({
    super.key,
    required this.status,
  });

  final MessageStatus status;

  @override
  Widget build(BuildContext context) {
    const double iconSize = 18;

    final Color iconColor = status == MessageStatus.seen
        ? CupertinoColors.darkBackgroundGray
        : CupertinoColors.inactiveGray;

    final double iconOpacity =
    status == MessageStatus.sent || status == MessageStatus.seen ? 1 : 0;

    return Stack(
      children: [
        Icon(
          CupertinoIcons.checkmark_alt,
          color: iconColor,
          size: iconSize,
        ),
        AnimatedOpacity(
          duration: const Duration(milliseconds: 240),
          opacity: iconOpacity,
          child: Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Icon(
              CupertinoIcons.checkmark_alt,
              color: iconColor,
              size: iconSize,
            ),
          ),
        ),
      ],
    );
  }
}
