import 'package:chat_app/core/navigation/navigation.dart';
import 'package:chat_app/core/resources/images.dart';
import 'package:chat_app/di_container.dart';
import 'package:chat_app/features/auth/view/cubit/auth_cubit.dart';
import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:chat_app/features/chats/domain/entities/chat_participant_entity/chat_participant_entity.dart';
import 'package:chat_app/features/chats/domain/entities/message_entity/message_entity.dart';
import 'package:chat_app/features/chats/view/screens/mini_chat_screen.dart';
import 'package:chat_app/features/chats/view/widgets/chat_screen/chat_default_image.dart';
import 'package:chat_app/features/chats/view/widgets/chats_listing_screen/chats_list_item.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ChatsListItemWrapper extends StatelessWidget {
  const ChatsListItemWrapper({
    super.key,
    required this.chat,
  });

  final ChatEntity chat;

  @override
  Widget build(BuildContext context) {
    final MessageEntity? lastMessage = chat.messages.lastOrNull;

    final int userId =
        context.select((AuthCubit cubit) => cubit.state).currentUser.id;

    String? newChatTitle;

    if (chat.type == ChatType.private) {
      final ChatParticipantEntity? participant =
          chat.participants.firstWhereOrNull(
        (p) => p.userId != userId,
      );

      if (participant != null) {
        newChatTitle = participant.name;
      }
    }

    final Widget chatImage = chat.type == ChatType.savedMessages
        ? Image.asset(AppImages.savedMessages, height: 100)
        : ChatDefaultImage(
            title: newChatTitle ?? chat.title,
            size: 60,
          );

    return ChatsListItem(
      pinned: chat.isPinned,
      title: newChatTitle ?? chat.title,
      draftText: chat.text,
      messages: chat.messages,
      subtitle: lastMessage?.content,
      trailingText: lastMessage == null && lastMessage?.updatedAt == null
          ? null
          : DateFormat.EEEE().format(lastMessage!.updatedAt).substring(0, 3),
      onPressed: () => context.goNamed(
        AppRoutes.chat.name,
        pathParameters: {
          'chatId': chat.id.toString(),
        },
      ),
      leading: chatImage,
      onLongPressWidget: (alignment) {
        return BlocProvider.value(
          value: getIt<ChatsCubit>(),
          child: MiniChatScreen(
            alignment: alignment,
            title: chat.title,
            messages: chat.messages,
            chat: chat,
            chatImage: chatImage,
          ),
        );
      },
    );
  }
}
