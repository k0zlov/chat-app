import 'package:chat_app/core/navigation/navigation.dart';
import 'package:chat_app/core/resources/images.dart';
import 'package:chat_app/features/chats/domain/entities/message_entity/message_entity.dart';
import 'package:chat_app/features/chats/view/cubit/chats_cubit.dart';
import 'package:chat_app/features/chats/view/widgets/chats_listing_screen/chats_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ChatsList extends StatelessWidget {
  const ChatsList({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatsState state = context.select((ChatsCubit cubit) => cubit.state);

    return SliverList.list(
      children: [
        CupertinoListSection(
          topMargin: 0,
          children: [
            ChatsListItem(
              title: 'Archived Chats',
              subtitle: 'Name, chat, first, second, third...',
              leading: Image.asset(AppImages.archivedChats, height: 100),
              messages: [],
              onPressed: () {},
            ),
            ChatsListItem(
              title: 'Saved Messages',
              subtitle: 'saved message',
              trailingText: 'Mon',
              messages: [],
              leading: Image.asset(AppImages.savedMessages),
              onPressed: () {},
            ),
            ...state.chats.map((chat) {
              final MessageEntity? lastMessage = chat.messages.lastOrNull;

              return ChatsListItem(
                pinned: true,
                title: chat.title,
                draftText: chat.text,
                messages: chat.messages,
                subtitle: lastMessage?.content,
                trailingText:
                    lastMessage == null && lastMessage?.updatedAt == null
                        ? null
                        : DateFormat.EEEE()
                            .format(lastMessage!.updatedAt)
                            .substring(0, 3),
                onPressed: () => context.goNamed(
                  AppRoutes.chat.name,
                  pathParameters: {
                    'chatId': chat.id.toString(),
                  },
                ),
              );
            }),
          ],
        ),
      ],
    );
  }
}
