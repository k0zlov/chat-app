import 'package:chat_app/core/widgets/context_menu/context_menu.dart';
import 'package:chat_app/core/widgets/context_menu/context_menu_action.dart';
import 'package:chat_app/features/auth/view/cubit/auth_cubit.dart';
import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:chat_app/features/chats/domain/entities/chat_participant_entity/chat_participant_entity.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MiniChatContextMenu extends StatelessWidget {
  const MiniChatContextMenu({
    super.key,
    required this.visible,
    required this.duration,
    required this.chat,
  });

  final ChatEntity chat;

  final bool visible;

  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final ChatsCubit cubit = context.read<ChatsCubit>();

    final int userId =
        context.select((AuthCubit cubit) => cubit.state).currentUser.id;

    final ChatParticipantEntity? participant =
        chat.participants.firstWhereOrNull((p) => p.userId == userId);

    final ChatType type = chat.type;

    final bool canDeleteChat = participant != null &&
        participant.role.isOwner &&
        !type.isSavedMessages;

    return Align(
      alignment: Alignment.bottomRight,
      child: ContextMenu(
        animationAlignment: Alignment.bottomCenter,
        duration: duration,
        actions: [
          ContextMenuAction(
            title: chat.isPinned ? 'Unpin' : 'Pin',
            iconData: CupertinoIcons.pin_slash,
            onPressed: () => cubit.updatePinChat(
              chatId: chat.id,
              isPinned: !chat.isPinned,
            ),
          ),
          ContextMenuAction(
            title: chat.isArchived ? 'Unarchive' : 'Archive',
            iconData: CupertinoIcons.archivebox,
            onPressed: () => cubit.updateArchiveChat(
              chatId: chat.id,
              isArchived: !chat.isArchived,
            ),
          ),
          if (canDeleteChat) ...{
            ContextMenuAction(
              title: 'Delete',
              destructive: true,
              iconData: CupertinoIcons.delete,
              onPressed: () {},
            ),
          },
        ],
      ),
    );
  }
}
