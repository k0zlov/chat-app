import 'package:chat_app/core/resources/images.dart';
import 'package:chat_app/core/widgets/buttons/cupertino_reload_button.dart';
import 'package:chat_app/features/chats/domain/entities/message_entity/message_entity.dart';
import 'package:chat_app/features/chats/view/cubit/chats_cubit.dart';
import 'package:chat_app/features/chats/view/widgets/chat_screen/chat_messages_date.dart';
import 'package:chat_app/features/chats/view/widgets/chat_screen/chat_messages_item.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:intl/intl.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({
    super.key,
    required this.messages,
  });

  final List<MessageEntity> messages;

  @override
  Widget build(BuildContext context) {
    final ChatsCubit cubit = context.read<ChatsCubit>();
    final ChatsState state = context.select((ChatsCubit cubit) => cubit.state);

    final List<MessageEntity> sortedMessages = messages.sorted(
      (first, second) {
        return first.createdAt.compareTo(second.createdAt);
      },
    ).toList();

    final String backgroundImageAsset =
        CupertinoTheme.of(context).brightness == Brightness.dark
            ? AppImages.darkChatWallpaper
            : AppImages.lightChatWallpaper;

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
          Image.asset(
            backgroundImageAsset,
            height: MediaQuery.of(context).size.height - kToolbarHeight,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          CustomScrollView(
            slivers: [
              ...messagesByDays.entries.map((entry) {
                final List<MessageEntity> messages = entry.value;

                return SliverStickyHeader.builder(
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ChatMessagesDate(date: entry.key),
                    );
                  },
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: messages.length,
                      (context, i) {
                        return ChatMessagesItem(
                          message: messages[i].content,
                          dateTime: messages[i].createdAt,
                          messageAuthor: false,
                        );
                      },
                    ),
                  ),
                );
              }),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, right: 20),
              child: CupertinoReloadButton(
                showBackgroundColor: true,
                onLoading: cubit.fetchChats,
                loading: state.loadingChats,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
