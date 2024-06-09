import 'package:chat_app/core/widgets/context_menu/context_menu.dart';
import 'package:chat_app/core/widgets/context_menu/context_menu_action.dart';
import 'package:flutter/cupertino.dart';

class MiniChatContextMenu extends StatelessWidget {
  const MiniChatContextMenu({
    super.key,
    required this.visible,
    required this.duration,
  });

  final bool visible;

  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: ContextMenu(
        animationAlignment: Alignment.bottomCenter,
        duration: duration,
        actions: [
          ContextMenuAction(
            title: 'Add to Folder',
            iconData: CupertinoIcons.folder_open,
            onPressed: () {},
          ),
          ContextMenuAction(
            title: 'Mark as Read',
            iconData: CupertinoIcons.eye,
            onPressed: () {},
          ),
          ContextMenuAction(
            title: 'Unpin',
            iconData: CupertinoIcons.pin_slash,
            onPressed: () {},
          ),
          ContextMenuAction(
            title: 'Unmute',
            iconData: CupertinoIcons.bell,
            onPressed: () {},
          ),
          ContextMenuAction(
            title: 'Delete',
            destructive: true,
            iconData: CupertinoIcons.delete,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
