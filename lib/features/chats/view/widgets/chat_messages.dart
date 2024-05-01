import 'package:chat_app/core/resources/images.dart';
import 'package:chat_app/core/widgets/buttons/cupertino_reload_button.dart';
import 'package:chat_app/features/chats/domain/entities/message_entity/message_entity.dart';
import 'package:chat_app/features/chats/view/cubit/chats_cubit.dart';
import 'package:chat_app/features/chats/view/widgets/chat_messages_item.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({
    super.key,
    required this.messages,
  });

  final List<MessageEntity> messages;

  @override
  Widget build(BuildContext context) {
    final ChatsCubit cubit = context.read<ChatsCubit>();
    final ChatsState state = context.select((ChatsCubit cubit) => cubit.state);

    final List<MessageEntity> messagesByTimeStamp = messages
        .sorted(
          (first, second) {
            return first.createdAt.compareTo(second.createdAt);
          },
        )
        .reversed
        .toList();

    final String backgroundImageAsset =
        CupertinoTheme.of(context).brightness == Brightness.dark
            ? AppImages.darkChatWallpaper
            : AppImages.lightChatWallpaper;

    return SizedBox(
      height: MediaQuery.of(context).size.height - 170,
      child: Stack(
        children: [
          Image.asset(
            backgroundImageAsset,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          ListView(
            reverse: true,
            children: [
              ...messagesByTimeStamp.map(
                (e) => ChatMessagesItem(
                  message: e.content,
                  dateTime: e.createdAt,
                  messageAuthor: false,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: CupertinoReloadButton(
                onLoading: cubit.fetchChats,
                loading: state.loadingChats,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
