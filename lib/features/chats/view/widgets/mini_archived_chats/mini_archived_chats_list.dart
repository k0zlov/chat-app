import 'package:chat_app/features/chats/domain/entities/chat_entity/chat_entity.dart';
import 'package:chat_app/features/chats/view/widgets/chats_listing_screen/chats_list_item_wrapper.dart';
import 'package:flutter/cupertino.dart';

class MiniArchivedChatsList extends StatelessWidget {
  const MiniArchivedChatsList({
    super.key,
    required this.chats,
  });

  final List<ChatEntity> chats;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          if (chats.isNotEmpty) ...{
            CupertinoListSection(
              children: [
                for (final ChatEntity chat in chats) ...{
                  ChatsListItemWrapper(chat: chat),
                },
              ],
            ),
          },
        ],
      ),
    );
  }
}
