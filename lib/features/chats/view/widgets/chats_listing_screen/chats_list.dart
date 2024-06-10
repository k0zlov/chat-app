import 'package:chat_app/core/resources/images.dart';
import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:chat_app/features/chats/domain/entities/message_entity/message_entity.dart';
import 'package:chat_app/features/chats/view/widgets/chats_listing_screen/chats_list_item.dart';
import 'package:chat_app/features/chats/view/widgets/chats_listing_screen/chats_list_item_wrapper.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatsList extends StatelessWidget {
  const ChatsList({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatsState state = context.select((ChatsCubit cubit) => cubit.state);

    final List<ChatEntity> withoutArchived =
        state.chats.whereNot((e) => e.isArchived).toList();

    final List<ChatEntity> chats = withoutArchived.sorted((a, b) {
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

    final List<ChatEntity> archivedChats =
        state.chats.where((e) => e.isArchived).toList();

    final String archivedChatsString =
        archivedChats.map((e) => e.title).join(', ');

    return SliverList.list(
      children: [
        CupertinoListSection(
          topMargin: 0,
          children: [
            ChatsListItem(
              leading: Image.asset(AppImages.archivedChats, height: 100),
              onPressed: () {},
              title: 'Archived Chats',
              subtitle: archivedChatsString,
              messages: const [],
              onLongPressWidget: (_) => const SizedBox(),
            ),
            ...chats.map((chat) {
              return ChatsListItemWrapper(chat: chat);
            }),
          ],
        ),
      ],
    );
  }
}
