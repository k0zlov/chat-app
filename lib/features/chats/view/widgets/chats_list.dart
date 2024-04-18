import 'package:chat_app/core/resources/images.dart';
import 'package:chat_app/features/chats/view/widgets/chats_list_item.dart';
import 'package:flutter/cupertino.dart';

class ChatsList extends StatelessWidget {
  const ChatsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.list(
      children: [
        CupertinoListSection(
          topMargin: 0,
          children: [
            ChatsListItem(
              title: 'Archived Messages',
              subtitle: 'Name, chat, first, second, third...',
              leading: Image.asset(AppImages.archivedChats),
              onPressed: () {},
            ),
            ChatsListItem(
              title: 'Saved Messages',
              subtitle: 'saved message',
              trailingText: 'Mon',
              leading: Image.asset(AppImages.savedMessages),
              onPressed: () {},
            ),
            ChatsListItem(
              pinned: true,
              title: 'Cool chat name',
              subtitle: 'some message',
              trailingText: 'Tue',
              leading: Image.asset(
                AppImages.chat,
                fit: BoxFit.contain,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
