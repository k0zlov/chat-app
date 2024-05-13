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
    return EditScreen(
      onDone: () {},
      onCancel: context.pop,
      sliverBody: _ChatEditScreenBody(chatId: chatId),
    );
  }
}

class _ChatEditScreenBody extends StatelessWidget {
  const _ChatEditScreenBody({
    required this.chatId,
  });

  final int chatId;

  @override
  Widget build(BuildContext context) {
    final ChatsState state = context.select((ChatsCubit cubit) => cubit.state);

    final ChatEntity? chat = state.chats.firstWhereOrNull(
      (chat) => chat.id == chatId,
    );

    return SliverList.list(
      children: [
        Hero(
          tag: chatId,
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
              placeholder: 'Group Name',
              text: chat!.title,
              onChanged: (_) {},
            ),
            EditScreenTextOption(
              placeholder: 'Description',
              text: chat.description ?? '',
              onChanged: (_) {},
            ),
          ],
        ),
      ],
    );
  }
}
