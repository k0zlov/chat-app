import 'package:chat_app/core/resources/images.dart';
import 'package:chat_app/features/chats/domain/entities/chat_entity/chat_entity.dart';
import 'package:chat_app/features/chats/view/cubit/chats_cubit.dart';
import 'package:chat_app/features/chats/view/widgets/chats_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            for (final ChatEntity chat in state.chats) ...{
              ChatsListItem(
                pinned: true,
                title: chat.title,
                subtitle: chat.messages.lastOrNull == null
                    ? null
                    : chat.messages.last.content,
                trailingText: chat.messages.lastOrNull == null
                    ? null
                    : DateFormat.EEEE().format(chat.messages.last.updatedAt!),
                leading: Image.asset(
                  AppImages.chat,
                  fit: BoxFit.contain,
                ),
                onPressed: () {},
              ),
            },
          ],
        ),
      ],
    );
  }
}
