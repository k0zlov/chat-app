import 'package:chat_app/features/chats/domain/entities/chat_entity/chat_entity.dart';
import 'package:chat_app/features/chats/view/widgets/mini_archived_chats/mini_archived_chats.dart';
import 'package:flutter/cupertino.dart';

class MiniArchivedChatsScreen extends StatefulWidget {
  const MiniArchivedChatsScreen({
    super.key,
    required this.chats,
    required this.alignment,
  });

  final List<ChatEntity> chats;
  final Alignment alignment;

  @override
  State<MiniArchivedChatsScreen> createState() =>
      _MiniArchivedChatsScreenState();
}

class _MiniArchivedChatsScreenState extends State<MiniArchivedChatsScreen> {
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
              MiniArchivedChats(
                chats: widget.chats,
                visible: _showMenu,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
