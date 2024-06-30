import 'package:chat_app/core/navigation/navigation.dart';
import 'package:chat_app/core/resources/images.dart';
import 'package:chat_app/features/auth/domain/entities/user_entity/user_entity.dart';
import 'package:chat_app/features/auth/view/cubit/auth_cubit.dart';
import 'package:chat_app/features/chats/domain/entities/chat_entity/chat_entity.dart';
import 'package:chat_app/features/chats/domain/entities/chat_participant_entity/chat_participant_entity.dart';
import 'package:chat_app/features/chats/view/cubit/chats_cubit.dart';
import 'package:chat_app/features/chats/view/screens/mini_archived_chats_screen.dart';
import 'package:chat_app/features/chats/view/widgets/chats_listing_screen/chats_list_item.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ArchivedChatItem extends StatelessWidget {
  const ArchivedChatItem({super.key});

  String _getName(ChatEntity chat, UserEntity user) {
    final ChatParticipantEntity? participant =
        chat.participants.firstWhereOrNull(
      (e) => e.userId != user.id,
    );

    if (participant == null) return chat.title;

    return participant.name;
  }

  @override
  Widget build(BuildContext context) {
    final UserEntity currentUser =
        context.select((AuthCubit cubit) => cubit.state).currentUser;

    final ChatsState state = context.select((ChatsCubit cubit) => cubit.state);

    final List<ChatEntity> archivedChats =
        state.chats.where((e) => e.isArchived).toList();

    final String archivedChatsString = archivedChats
        .map((e) => e.type.isPrivate ? _getName(e, currentUser) : e.title)
        .join(', ');

    return ChatsListItem(
      leading: Image.asset(
        AppImages.archivedChats,
        height: 100,
      ),
      onPressed: () => context.goNamed(
        AppRoutes.archivedChats.name,
      ),
      title: 'Archived Chats',
      subtitle: archivedChatsString,
      messages: const [],
      onLongPressWidget: (alignment) => MiniArchivedChatsScreen(
        chats: archivedChats,
        alignment: alignment,
      ),
    );
  }
}
