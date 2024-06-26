import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class ChatMessagesDate extends StatelessWidget {
  const ChatMessagesDate({
    super.key,
    required this.date,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final textStyle = CupertinoTheme.of(context).textTheme.textStyle.copyWith(
          fontSize: 12,
          color: CupertinoColors.lightBackgroundGray,
        );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 17,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color.lerp(
              CupertinoTheme.of(context).primaryColor,
              CupertinoColors.black,
              0.4,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
          clipBehavior: Clip.hardEdge,
          child: Text(
            DateFormat.MMMd().format(date),
            textAlign: TextAlign.center,
            style: textStyle,
          ),
        ),
      ],
    );
  }
}
