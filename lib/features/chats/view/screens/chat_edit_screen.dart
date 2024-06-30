import 'package:chat_app/core/widgets/screens/edit_screen/edit_screen.dart';
import 'package:chat_app/core/widgets/screens/edit_screen/edit_set_new_photo_button.dart';
import 'package:chat_app/core/widgets/screens/edit_screen/edit_text_option.dart';
import 'package:chat_app/features/chats/domain/entities/chat_entity/chat_entity.dart';
import 'package:chat_app/features/chats/view/cubit/chats_cubit.dart';
import 'package:chat_app/features/chats/view/widgets/chat_screen/chat_app_bar_image.dart';
import 'package:chat_app/features/settings/view/widgets/settings_screen/settings_app_bar.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ChatEditScreen extends StatelessWidget {
  const ChatEditScreen({
    super.key,
    required this.chatId,
  });

  final int chatId;

  @override
  Widget build(BuildContext context) {
    final ChatsCubit cubit = context.read<ChatsCubit>();
    final ChatsState state = context.select((ChatsCubit cubit) => cubit.state);

    final ChatEntity? chat = state.chats.firstWhereOrNull(
      (chat) => chat.id == chatId,
    );

    return EditScreen(
      onDone: () {
        cubit.updateChat(chatId: chatId);
        context.pop();
      },
      onCancel: () {
        cubit
          ..onEditChatTitle(chat.title, chat)
          ..onEditChatDescription(chat.description ?? '', chat);

        context.pop();
      },
      sliverBody: _ChatEditScreenBody(
        chat: chat!,
      ),
    );
  }
}

class _ChatEditScreenBody extends StatelessWidget {
  const _ChatEditScreenBody({
    required this.chat,
  });

  final ChatEntity chat;

  @override
  Widget build(BuildContext context) {
    final ChatsCubit cubit = context.read<ChatsCubit>();

    return SliverList.list(
      children: [
        Hero(
          tag: chat.id,
          child: ChatAppBarImage(
            mode: AppBarMode.basic,
            detailsMode: true,
            useMargin: false,
            onImagePressed: () {},
          ),
        ),
        EditScreenSetNewPhotoButton(onPressed: () {}),
        CupertinoListSection.insetGrouped(
          hasLeading: false,
          dividerMargin: 0,
          backgroundColor: Colors.transparent,
          children: [
            EditScreenTextOption(
              placeholder: 'Title',
              text: chat.editTitleText,
              onChanged: (title) => cubit.onEditChatTitle(
                title,
                chat,
              ),
            ),
            EditScreenTextOption(
              placeholder: 'Description',
              text: chat.editDescriptionText,
              onChanged: (description) => cubit.onEditChatDescription(
                description,
                chat,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
