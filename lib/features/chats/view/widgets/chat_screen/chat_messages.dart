import 'package:chat_app/features/chats/domain/entities/message_entity/message_entity.dart';
import 'package:chat_app/features/chats/view/widgets/chat_screen/chat_background_image.dart';
import 'package:chat_app/features/chats/view/widgets/chat_screen/chat_messages_date.dart';
import 'package:chat_app/features/chats/view/widgets/chat_screen/chat_messages_item.dart';
import 'package:chat_app/features/chats/view/widgets/chat_screen/chat_reload_button.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({
    super.key,
    required this.messages,
  });

  final List<MessageEntity> messages;

  @override
  Widget build(BuildContext context) {
    final List<MessageEntity> sortedMessages = messages.sorted(
      (first, second) {
        return first.createdAt.compareTo(second.createdAt);
      },
    ).toList();

    final Map<String, List<MessageEntity>> messagesByDays = {};

    for (final MessageEntity message in sortedMessages) {
      final String dateString = DateFormat.MMMMd().format(message.createdAt);

      if (messagesByDays[dateString] == null) {
        messagesByDays[dateString] = [];
      }

      messagesByDays[dateString]!.add(message);
    }

    return SizedBox(
      height: MediaQuery.of(context).size.height - kToolbarHeight - 110,
      child: Stack(
        children: [
          const ChatBackgroundImage(),
          CustomScrollView(
            reverse: true,
            slivers: [
              for (final entry in messagesByDays.entries.toList().reversed) ...{
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: entry.value.length,
                    (context, index) {
                      final MessageEntity message = entry.value[index];

                      return ChatMessagesItem(
                        message: message.content,
                        dateTime: message.createdAt,
                        messageAuthor: false,
                      );
                    },
                  ),
                ),
                SliverPersistentHeader(
                  delegate: _DateHeaderDelegate(entry.key),
                ),
              },
            ],
          ),
          const ChatReloadButton(),
        ],
      ),
    );
  }
}

class _DateHeaderDelegate extends SliverPersistentHeaderDelegate {
  _DateHeaderDelegate(this.date);

  final String date;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return ChatMessagesDate(date: date);
  }

  @override
  double get minExtent => 50;

  @override
  double get maxExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
