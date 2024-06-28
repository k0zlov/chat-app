import 'package:chat_app/features/chats/domain/entities/message_entity/message_entity.dart';
import 'package:flutter/cupertino.dart';

class ChatMessagesInfoItem extends StatelessWidget {
  const ChatMessagesInfoItem({
    super.key,
    required this.message,
  });

  final MessageEntity message;

  @override
  Widget build(BuildContext context) {
    final theme = CupertinoTheme.of(context);

    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: theme.barBackgroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            child: Text(message.content),
          ),
        ],
      ),
    );
  }
}
