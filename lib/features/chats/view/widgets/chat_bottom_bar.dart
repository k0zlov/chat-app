import 'dart:ui';

import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:chat_app/features/chats/view/widgets/chat_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBottomBar extends StatelessWidget {
  const ChatBottomBar({
    super.key,
    required this.chat,
  });

  final ChatEntity chat;

  @override
  Widget build(BuildContext context) {
    final ChatsCubit cubit = context.read<ChatsCubit>();

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
            child: Row(
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
                } else if(chat.sendingMessage)...{
                  const CupertinoActivityIndicator(),
                } else ...{
                  SendMessageButton(
                    onPressed: () async => cubit.sendMessage(chatId: chat.id),
                  ),
                },
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SendMessageButton extends StatelessWidget {
  const SendMessageButton({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      borderRadius: BorderRadius.circular(30),
      color: CupertinoTheme.of(context).primaryColor,
      minSize: 35,
      child: const Icon(
        CupertinoIcons.arrow_up,
        size: 28,
        color: CupertinoColors.white,
      ),
    );
  }
}
