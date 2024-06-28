import 'package:chat_app/features/auth/auth_feature.dart';
import 'package:chat_app/features/chats/domain/entities/message_entity/message_entity.dart';
import 'package:chat_app/features/chats/view/widgets/chat_screen/chat_background_image.dart';
import 'package:chat_app/features/chats/view/widgets/chat_screen/chat_messages_date.dart';
import 'package:chat_app/features/chats/view/widgets/chat_screen/chat_reload_button.dart';
import 'package:chat_app/features/chats/view/widgets/chat_screen/chat_scroll_down_button.dart';
import 'package:chat_app/features/chats/view/widgets/chat_screen/messages_item.dart';
import 'package:chat_app/features/chats/view/widgets/chat_screen/messages_item_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';

class ChatMessages extends StatefulWidget {
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
  State<ChatMessages> createState() => _ChatMessagesState();
}

class _ChatMessagesState extends State<ChatMessages> {
  final ScrollController _scrollController = ScrollController();

  @override
  void didUpdateWidget(covariant ChatMessages oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.messages != widget.messages) _scrollDown();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollDown() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 240),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<MessageEntity> groupedMessages = [
      MessageEntity(createdAt: DateTime(1999), updatedAt: DateTime(1999)),
      ...widget.messages,
    ];

    final AuthState authState = context.select(
      (AuthCubit cubit) => cubit.state,
    );

    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Stack(
        children: [
          const ChatBackgroundImage(),
          GroupedListView<MessageEntity, DateTime>(
            controller: _scrollController,
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

              return message.type.isInfo
                  ? ChatMessagesInfoItem(message: message)
                  : ChatMessagesItem(
                      message: message,
                      messageAuthor: authState.currentUser.id == message.userId,
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
          ChatScrollDownButton(
            scrollController: _scrollController,
            onPressed: _scrollDown,
          ),
        ],
      ),
    );
  }
}
