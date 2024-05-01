import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:chat_app/features/chats/view/widgets/chat_bottom_bar.dart';
import 'package:chat_app/features/chats/view/widgets/chat_messages.dart';
import 'package:chat_app/features/chats/view/widgets/chat_sliver_app_bar.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
    required this.chatId,
  });

  final int chatId;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool _detailsMode = false;

  final ScrollController _scrollController = ScrollController();

  void _setDetailsMode(bool newValue) {
    if (_detailsMode == newValue) return;

    _detailsMode = newValue;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final ChatsState state = context.select((ChatsCubit cubit) => cubit.state);

    final ChatEntity? chat = state.chats.firstWhereOrNull(
      (chat) => chat.id == widget.chatId,
    );

    return CupertinoPageScaffold(
      child: CustomScrollView(
        controller: _scrollController,
        physics: _detailsMode
            ? const ScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        slivers: [
          ChatSliverAppBar(
            chat: chat!,
            detailsMode: _detailsMode,
            setDetailsMode: _setDetailsMode,
            scrollController: _scrollController,
          ),
          SliverFillRemaining(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ChatMessages(messages: chat.messages),
                  ChatBottomBar(chat: chat),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
