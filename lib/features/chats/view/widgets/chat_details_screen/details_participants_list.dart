import 'package:chat_app/features/chats/domain/entities/chat_participant_entity/chat_participant_entity.dart';
import 'package:chat_app/features/contacts/view/widgets/contacts_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatDetailsParticipantsList extends StatelessWidget {
  const ChatDetailsParticipantsList({
    super.key,
    required this.participants,
  });

  final List<ChatParticipantEntity> participants;

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor =
        CupertinoTheme.of(context).brightness == Brightness.dark
            ? CupertinoColors.darkBackgroundGray
            : CupertinoColors.white;

    return CupertinoListSection.insetGrouped(
      backgroundColor: Colors.transparent,
      children: [
        ContactsListItem(
          title: 'Add Members',
          onPressed: () {},
          titleColor: CupertinoTheme.of(context).primaryColor,
          pressable: false,
          backgroundColor: backgroundColor,
          leading: const Icon(
            CupertinoIcons.person_add,
            size: 28,
          ),
        ),
        ...participants.map(
          (participant) {
            return ContactsListItem(
              onPressed: () {},
              pressable: false,
              backgroundColor: backgroundColor,
              title: participant.name,
              lastActivity: DateTime.now(),
            );
          },
        ),
      ],
    );
  }
}
