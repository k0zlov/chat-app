import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

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
    final textStyle = CupertinoTheme.of(context).textTheme.textStyle;

    final bool darkTheme =
        CupertinoTheme.of(context).brightness == Brightness.dark;

    final Color backgroundColor = messageAuthor
        ? CupertinoTheme.of(context).primaryColor
        : darkTheme
            ? CupertinoColors.darkBackgroundGray
            : CupertinoColors.lightBackgroundGray;

    return Container(
      width: double.infinity,
      alignment: messageAuthor ? Alignment.centerRight : Alignment.centerLeft,
      padding: const EdgeInsets.all(8),
      child: IntrinsicWidth(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: CupertinoListTile(
            title: Text(message),
            backgroundColor:
                darkTheme ? backgroundColor : backgroundColor.withAlpha(180),
            padding: const EdgeInsets.all(8),
            trailing: Padding(
              padding: const EdgeInsets.only(top: 6, left: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    DateFormat.Hm().format(dateTime),
                    style: textStyle.copyWith(
                      fontSize: 12,
                      color: CupertinoColors.inactiveGray,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
