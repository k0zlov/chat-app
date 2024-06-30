import 'package:chat_app/core/widgets/context_menu/context_menu.dart';
import 'package:chat_app/core/widgets/context_menu/context_menu_action.dart';
import 'package:chat_app/di_container.dart';
import 'package:chat_app/features/auth/auth_feature.dart';
import 'package:chat_app/features/auth/domain/entities/user_entity/user_entity.dart';
import 'package:chat_app/features/chats/domain/entities/chat_participant_entity/chat_participant_entity.dart';
import 'package:chat_app/features/chats/view/cubit/chats_cubit.dart';
import 'package:chat_app/features/contacts/view/widgets/contacts_list_item.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ParticipantsListItem extends StatelessWidget {
  const ParticipantsListItem({
    super.key,
    required this.participant,
    required this.chatParticipants,
  });

  final ChatParticipantEntity participant;
  final List<ChatParticipantEntity> chatParticipants;

  void _showContextMenu(
    BuildContext context,
    List<ContextMenuAction> actions,
  ) {
    final RenderBox box = context.findRenderObject()! as RenderBox;
    final Offset position = box.localToGlobal(Offset.zero);
    final Size size = box.size;

    final Offset offset = Offset(
      position.dx + size.width,
      position.dy + size.height - 40,
    );

    final screenSize = MediaQuery.of(context).size;

    final double xFactor = (offset.dx < screenSize.width / 2) ? -1 : 1;

    final Alignment alignment = Alignment(
      xFactor,
      (offset.dy / screenSize.height) * 2 - 1,
    );

    const Duration duration = Duration(milliseconds: 240);

    showDialog<void>(
      context: context,
      useRootNavigator: false,
      barrierColor: Colors.transparent,
      builder: (context) {
        return BlocProvider.value(
          value: getIt<ChatsCubit>(),
          child: SizedBox(
            height: screenSize.height,
            width: screenSize.width,
            child: Align(
              alignment: alignment,
              child: ContextMenu(
                animationAlignment: alignment,
                duration: duration,
                actions: actions,
              ),
            ),
          ),
        );
      },
    );
  }

  List<ContextMenuAction> buildActions(
    BuildContext context,
    ChatParticipantEntity userParticipant,
    ChatParticipantEntity targetParticipant,
  ) {
    final ChatParticipantRole role = userParticipant.role;
    final ChatParticipantRole targetRole = targetParticipant.role;

    final ChatsCubit cubit = context.read<ChatsCubit>();

    final bool showKickOption =
        (role.isAdmin && targetRole.isMember) || role.isOwner;

    return [
      if (role.isOwner) ...{
        ContextMenuAction(
          title: 'Set Owner',
          onPressed: () => cubit.updateParticipant(
            chatId: targetParticipant.chatId,
            targetId: targetParticipant.userId,
            role: ChatParticipantRole.owner,
          ),
        ),
      },
      if (role.isOwner && targetRole.isMember) ...{
        ContextMenuAction(
          title: 'Set Admin',
          onPressed: () => cubit.updateParticipant(
            chatId: targetParticipant.chatId,
            targetId: targetParticipant.userId,
            role: ChatParticipantRole.admin,
          ),
        ),
      },
      if (showKickOption) ...{
        ContextMenuAction(
          title: 'Kick',
          destructive: true,
          onPressed: () {},
        ),
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final UserEntity currentUser =
        context.select((AuthCubit cubit) => cubit.state).currentUser;

    final bool isCurrentUser = currentUser.id == participant.userId;

    final ChatParticipantEntity? userParticipant =
        chatParticipants.firstWhereOrNull((e) => e.userId == currentUser.id);

    final bool allowPressing = !isCurrentUser &&
        userParticipant != null &&
        userParticipant.role != participant.role &&
        !userParticipant.role.isMember &&
        !participant.role.isOwner;

    final Color backgroundColor =
        CupertinoTheme.of(context).brightness == Brightness.dark
            ? CupertinoColors.darkBackgroundGray
            : CupertinoColors.white;

    final List<ContextMenuAction> actions = !allowPressing
        ? []
        : buildActions(
            context,
            userParticipant,
            participant,
          );

    return ContactsListItem(
      title: participant.name,
      lastActivity: participant.lastActivityAt,
      pressable: allowPressing,
      onPressed: () {},
      onLongPressed: () => _showContextMenu(context, actions),
      backgroundColor: backgroundColor,
      trailing: participant.role.isMember
          ? null
          : _ParticipantRole(
              role: participant.role,
            ),
    );
  }
}

class _ParticipantRole extends StatelessWidget {
  const _ParticipantRole({
    required this.role,
  });

  final ChatParticipantRole role;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(role.name),
    );
  }
}
