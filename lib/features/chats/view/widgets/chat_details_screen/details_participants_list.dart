import 'package:chat_app/features/chats/domain/entities/chat_participant_entity/chat_participant_entity.dart';
import 'package:chat_app/features/chats/view/widgets/chat_details_screen/participants_list_item.dart';
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
    return CupertinoListSection.insetGrouped(
      backgroundColor: Colors.transparent,
      children: [
        ...participants.map(
          (participant) {
            return ParticipantsListItem(
              participant: participant,
              chatParticipants: participants,
            );
          },
        ),
      ],
    );
  }
}
