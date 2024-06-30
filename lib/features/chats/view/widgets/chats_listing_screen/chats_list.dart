import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:chat_app/features/chats/domain/entities/message_entity/message_entity.dart';
import 'package:chat_app/features/chats/view/widgets/chats_listing_screen/archived_chat_item.dart';
import 'package:chat_app/features/chats/view/widgets/chats_listing_screen/chats_list_item_wrapper.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';

class ChatsList extends StatelessWidget {
  const ChatsList({
    super.key,
    required this.chats,
    required this.showArchivedChats,
  });

  final List<ChatEntity> chats;

  final bool showArchivedChats;

  @override
  Widget build(BuildContext context) {
    final List<ChatEntity> chatList = chats.sorted((a, b) {
      if (a.isPinned == b.isPinned) return 0;

      if (a.isPinned) return -1;
      if (b.isPinned) return 1;

      final MessageEntity? aLastMessage = a.messages.lastOrNull;
      final MessageEntity? bLastMessage = b.messages.lastOrNull;

      if (aLastMessage == bLastMessage) return 0;

      if (aLastMessage == null) return -1;
      if (bLastMessage == null) return 1;

      return bLastMessage.createdAt.compareTo(aLastMessage.createdAt);
    });

    return chatList.isEmpty
        ? SliverList.list(children: const [])
        : SliverList.list(
            children: [
              CupertinoListSection(
                topMargin: 0,
                children: [
                  if (showArchivedChats) ...{
                    const ArchivedChatItem(),
                  },
                  ...chatList.map((chat) {
                    return ChatsListItemWrapper(chat: chat);
                  }),
                ],
              ),
            ],
          );
  }
}
