import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart' hide TextDirection;

class ChatMessagesItem extends StatelessWidget {
  const ChatMessagesItem({
    super.key,
    required this.message,
    required this.dateTime,
    required this.messageAuthor,
  });

  final String message;
  final DateTime dateTime;
  final bool messageAuthor;

  @override
  Widget build(BuildContext context) {
    final theme = CupertinoTheme.of(context);

    final textStyle = theme.textTheme.textStyle;

    final bool darkTheme = theme.brightness == Brightness.dark;

    final Color backgroundColor = messageAuthor
        ? theme.primaryColor
        : darkTheme
            ? CupertinoColors.darkBackgroundGray
            : CupertinoColors.lightBackgroundGray;

    final Color timeTextColor = messageAuthor
        ? CupertinoColors.black.withOpacity(0.4)
        : CupertinoColors.inactiveGray;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment:
            messageAuthor ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 50,
              maxWidth: MediaQuery.of(context).size.width / 1.5,
            ),
            child: IntrinsicWidth(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: darkTheme
                      ? backgroundColor
                      : backgroundColor.withAlpha(180),
                ),
                padding: const EdgeInsets.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(message, maxLines: 100),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      DateFormat.Hm().format(dateTime),
                      style: textStyle.copyWith(
                        fontSize: 12,
                        color: timeTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
