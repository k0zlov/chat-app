import 'dart:ui';

import 'package:chat_app/features/auth/auth_feature.dart';
import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:chat_app/features/chats/domain/entities/chat_participant_entity/chat_participant_entity.dart';
import 'package:chat_app/features/chats/view/widgets/chat_screen/chat_text_field.dart';
import 'package:chat_app/features/chats/view/widgets/chat_screen/send_message_button.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBottomBar extends StatelessWidget {
  const ChatBottomBar({
    super.key,
    required this.chat,
    required this.searchMode,
    required this.showJoinChat,
  });

  final ChatEntity chat;

  final bool showJoinChat;
  final bool searchMode;

  @override
  Widget build(BuildContext context) {
    final ChatsCubit cubit = context.read<ChatsCubit>();

    final Color backgroundColor =
        CupertinoTheme.of(context).barBackgroundColor.withOpacity(0.9);

    final int userId =
        context.select((AuthCubit cubit) => cubit.state).currentUser.id;

    final ChatParticipantEntity? participant =
        chat.participants.firstWhereOrNull((p) => p.userId == userId);

    bool canSendMessages = true;

    if (participant != null && chat.type == ChatType.channel) {
      canSendMessages = participant.role != ChatParticipantRole.member;
    }

    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 50,
            sigmaY: 50,
            tileMode: TileMode.decal,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 22,
              left: 10,
              right: 10,
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 220),
              child: searchMode
                  ? const _SearchBody()
                  : showJoinChat
                      ? _JoinChatButton(
                          onPressed: () async => cubit.joinChat(chat.id),
                        )
                      : !canSendMessages
                          ? const _CantSendMessagesBody()
                          : _MessageTextFieldBody(chat: chat),
            ),
          ),
        ),
      ),
    );
  }
}

class _CantSendMessagesBody extends StatelessWidget {
  const _CantSendMessagesBody();

  @override
  Widget build(BuildContext context) {
    final textStyle = CupertinoTheme.of(context).textTheme.textStyle.copyWith(
          color: CupertinoColors.inactiveGray,
        );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("You can't send messages in this chat", style: textStyle),
      ],
    );
  }
}

class _JoinChatButton extends StatelessWidget {
  const _JoinChatButton({
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = CupertinoTheme.of(context);

    final textStyle = theme.textTheme.textStyle.copyWith(
      color: theme.primaryColor,
      fontSize: 18,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CupertinoButton(
          onPressed: onPressed,
          child: Text('Join Chat', style: textStyle),
        ),
      ],
    );
  }
}

class _SearchBody extends StatelessWidget {
  const _SearchBody();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            minSize: 0,
            onPressed: () {},
            child: const Icon(
              CupertinoIcons.calendar,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}

class _MessageTextFieldBody extends StatelessWidget {
  const _MessageTextFieldBody({
    required this.chat,
  });

  final ChatEntity chat;

  @override
  Widget build(BuildContext context) {
    final ChatsCubit cubit = context.read<ChatsCubit>();

    return Row(
      children: [
        CupertinoButton(
          onPressed: () {},
          padding: EdgeInsets.zero,
          minSize: 0,
          child: const Icon(
            CupertinoIcons.paperclip,
            size: 28,
            color: CupertinoColors.systemGrey,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ChatTextField(chat: chat),
          ),
        ),
        if (chat.text.isEmpty) ...{
          CupertinoButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            minSize: 35,
            child: const Icon(
              CupertinoIcons.mic,
              size: 28,
              color: CupertinoColors.systemGrey,
            ),
          ),
        } else if (chat.sendingMessage) ...{
          const CupertinoActivityIndicator(),
        } else ...{
          SendMessageButton(
            onPressed: () async => cubit.sendMessage(chatId: chat.id),
          ),
        },
      ],
    );
  }
}
