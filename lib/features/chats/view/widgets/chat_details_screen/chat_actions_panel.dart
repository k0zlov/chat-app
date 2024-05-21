import 'package:chat_app/core/widgets/context_menu/context_menu_action.dart';
import 'package:chat_app/features/chats/view/widgets/chat_details_screen/chat_action.dart';
import 'package:flutter/cupertino.dart';

class ChatActionsPanel extends StatefulWidget {
  const ChatActionsPanel({
    super.key,
    required this.blurred,
    required this.activateSearchMode,
  });

  final bool blurred;

  final void Function() activateSearchMode;

  @override
  State<ChatActionsPanel> createState() => _ChatActionsPanelState();
}

class _ChatActionsPanelState extends State<ChatActionsPanel> {
  int _selected = -1;

  void _selectAction(int index) {
    if (index == _selected) return;

    _selected = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final List<ChatActionData> actions = [
      ChatActionData(
        title: 'mute',
        iconData: CupertinoIcons.bell_fill,
        contextMenuActions: [
          ContextMenuAction(
            title: 'Mute for...',
            iconData: CupertinoIcons.zzz,
            onPressed: () {},
          ),
          ContextMenuAction(
            title: 'Disable Sound',
            iconData: CupertinoIcons.volume_off,
            onPressed: () {},
          ),
          ContextMenuAction(
            title: 'Customize',
            iconData: CupertinoIcons.line_horizontal_3,
            onPressed: () {},
          ),
          ContextMenuAction(
            title: 'Mute Forever',
            destructive: true,
            iconData: CupertinoIcons.bell_slash,
            onPressed: () {},
          ),
        ],
      ),
      ChatActionData(
        title: 'search',
        iconData: CupertinoIcons.search,
        onPressed: widget.activateSearchMode,
        contextMenuActions: [],
      ),
      ChatActionData(
        title: 'more',
        iconData: CupertinoIcons.ellipsis,
        contextMenuActions: [
          ContextMenuAction(
            title: 'Enable Auto-Delete',
            iconData: CupertinoIcons.timer,
            onPressed: () {},
          ),
          ContextMenuAction(
            title: 'Clear Messages',
            iconData: CupertinoIcons.clear,
            onPressed: () {},
          ),
          ContextMenuAction(
            title: 'Leave Group',
            destructive: true,
            iconData: CupertinoIcons.arrow_right_to_line,
            onPressed: () {},
          ),
        ],
      ),
    ];


    return SizedBox(
      height: 74,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            for (int i = 0; i < actions.length; i++) ...{
              ChatAction(
                index: i,
                blurred: widget.blurred,
                title: actions[i].title,
                icon: actions[i].iconData,
                selectAction: _selectAction,
                onPressed: actions[i].onPressed,
                selected: _selected == i || _selected == -1,
                contextMenuActions: actions[i].contextMenuActions,
              ),
            },
          ],
        ),
      ),
    );
  }
}
