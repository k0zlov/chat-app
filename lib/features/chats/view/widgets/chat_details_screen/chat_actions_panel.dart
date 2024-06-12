import 'package:chat_app/core/widgets/context_menu/context_menu_action.dart';
import 'package:chat_app/features/auth/view/cubit/auth_cubit.dart';
import 'package:chat_app/features/chats/domain/entities/chat_entity/chat_entity.dart';
import 'package:chat_app/features/chats/domain/entities/chat_participant_entity/chat_participant_entity.dart';
import 'package:chat_app/features/chats/view/widgets/chat_details_screen/chat_action.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatActionsPanel extends StatefulWidget {
  const ChatActionsPanel({
    super.key,
    required this.blurred,
    required this.activateSearchMode,
    required this.chat,
  });

  final ChatEntity chat;

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
    final int userId =
        context
            .select((AuthCubit cubit) => cubit.state)
            .currentUser
            .id;

    final ChatParticipantEntity? participant =
    widget.chat.participants.firstWhereOrNull(
          (p) => p.userId == userId,
    );

    final bool showLeaveOption = widget.chat.type != ChatType.private;

    final bool showDeleteOption = participant != null &&
        participant.role == ChatParticipantRole.owner &&
        widget.chat.type != ChatType.private;

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
      if (showLeaveOption) ...{
        ChatActionData(
          title: 'leave',
          iconData: CupertinoIcons.escape,
          contextMenuActions: [],
          onPressed: () {},
        ),
      },
      if (showDeleteOption) ...{
        ChatActionData(
          title: 'delete',
          iconData: CupertinoIcons.delete,
          onPressed: () {},
          contextMenuActions: [],
        ),
      },
    ];

    return SizedBox(
      height: 74,
      width: MediaQuery
          .of(context)
          .size
          .width,
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
