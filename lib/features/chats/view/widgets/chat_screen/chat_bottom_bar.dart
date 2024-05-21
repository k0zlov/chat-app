import 'dart:ui';

import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:chat_app/features/chats/view/widgets/chat_screen/chat_text_field.dart';
import 'package:chat_app/features/chats/view/widgets/chat_screen/send_message_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBottomBar extends StatelessWidget {
  const ChatBottomBar({
    super.key,
    required this.chat,
    required this.searchMode,
  });

  final ChatEntity chat;

  final bool searchMode;

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor =
        CupertinoTheme.of(context).barBackgroundColor.withOpacity(0.9);

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
                  : _MessageTextFieldBody(chat: chat),
            ),
          ),
        ),
      ),
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
