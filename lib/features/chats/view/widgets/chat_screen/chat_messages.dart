import 'package:chat_app/features/chats/domain/entities/message_entity/message_entity.dart';
import 'package:chat_app/features/chats/view/widgets/chat_screen/chat_background_image.dart';
import 'package:chat_app/features/chats/view/widgets/chat_screen/chat_messages_date.dart';
import 'package:chat_app/features/chats/view/widgets/chat_screen/chat_messages_item.dart';
import 'package:chat_app/features/chats/view/widgets/chat_screen/chat_reload_button.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({
    super.key,
    required this.messages,
    required this.height,
    this.width,
  });

  final double height;
  final double? width;

  final List<MessageEntity> messages;

  @override
  Widget build(BuildContext context) {
    final List<MessageEntity> groupedMessages = [
      MessageEntity(createdAt: DateTime(1999), updatedAt: DateTime(1999)),
      ...messages,
    ];

    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: [
          const ChatBackgroundImage(),
          GroupedListView<MessageEntity, DateTime>(
            physics: const AlwaysScrollableScrollPhysics(),
            cacheExtent: 200,
            useStickyGroupSeparators: true,
            reverse: true,
            order: GroupedListOrder.DESC,
            floatingHeader: true,
            elements: groupedMessages,
            itemBuilder: (context, message) {
              if (message == groupedMessages.first) {
                return const SizedBox();
              }

              return ChatMessagesItem(
                message: message,
                messageAuthor: false,
              );
            },
            stickyHeaderBackgroundColor: Colors.transparent,
            groupComparator: (first, second) {
              return first.compareTo(second);
            },
            groupSeparatorBuilder: (date) {
              if (date == groupedMessages.first.createdAt) {
                return const SizedBox();
              }
              return ChatMessagesDate(date: date);
            },
            groupBy: (message) {
              final DateTime date = message.createdAt;

              return DateTime(date.year, date.month, date.day);
            },
          ),
          const ChatReloadButton(),
        ],
      ),
    );
  }
}
