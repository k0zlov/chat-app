import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:chat_app/features/chats/domain/entities/message_entity/message_entity.dart';
import 'package:chat_app/features/chats/view/widgets/mini_chat_screen/mini_chat.dart';
import 'package:chat_app/features/chats/view/widgets/mini_chat_screen/mini_chat_context_menu.dart';
import 'package:flutter/cupertino.dart';

class MiniChatScreen extends StatefulWidget {
  const MiniChatScreen({
    super.key,
    required this.title,
    required this.messages,
    required this.alignment,
    required this.chatImage,
    required this.chat,
  });

  final ChatEntity chat;
  final String title;
  final Widget chatImage;
  final List<MessageEntity> messages;

  final Alignment alignment;

  @override
  State<MiniChatScreen> createState() => _MiniChatScreenState();
}

class _MiniChatScreenState extends State<MiniChatScreen> {
  bool _showMenu = true;

  final Duration _duration = const Duration(milliseconds: 240);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return PopScope(
      onPopInvoked: (_) async {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          _showMenu = false;
          setState(() {});
        });
        await Future.delayed(_duration, () {});
      },
      child: CupertinoPopupSurface(
        isSurfacePainted: false,
        child: Padding(
          padding: EdgeInsets.only(bottom: mediaQuery.padding.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MiniChat(
                visible: _showMenu,
                chat: widget.chat,
                chatImage: widget.chatImage,
                animationAlignment: widget.alignment,
                duration: _duration,
              ),
              MiniChatContextMenu(
                chat: widget.chat,
                visible: _showMenu,
                duration: _duration,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
