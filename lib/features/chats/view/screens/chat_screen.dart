import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:chat_app/features/chats/view/widgets/chat_bottom_bar.dart';
import 'package:chat_app/features/chats/view/widgets/chat_messages.dart';
import 'package:chat_app/features/chats/view/widgets/chat_sliver_app_bar.dart';
import 'package:chat_app/features/chats/view/widgets/details_participants_list.dart';
import 'package:chat_app/features/chats/view/widgets/details_tab_bar.dart';
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

    final mediaQuery = MediaQuery.of(context);

    return CupertinoPageScaffold(
      child: CustomScrollView(
        controller: _scrollController,
        physics:
            _detailsMode ? const ScrollPhysics() : const _CustomScrollPhysics(),
        slivers: [
          ChatSliverAppBar(
            chat: chat!,
            detailsMode: _detailsMode,
            setDetailsMode: _setDetailsMode,
            scrollController: _scrollController,
          ),
          SliverToBoxAdapter(
            child: Stack(
              children: [
                _ChatScreenMainBody(chat: chat),
                AnimatedPositioned(
                  left: _detailsMode ? 0 : mediaQuery.size.width,
                  duration: const Duration(milliseconds: 450),
                  child: _ChatScreenDetailsBody(chat: chat),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatScreenMainBody extends StatelessWidget {
  const _ChatScreenMainBody({
    required this.chat,
  });

  final ChatEntity chat;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const _CustomScrollPhysics(),
      child: Column(
        children: [
          ChatMessages(messages: chat.messages),
          ChatBottomBar(chat: chat),
        ],
      ),
    );
  }
}

class _ChatScreenDetailsBody extends StatelessWidget {
  const _ChatScreenDetailsBody({
    required this.chat,
  });

  final ChatEntity chat;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return SingleChildScrollView(
      child: Container(
        color: CupertinoTheme.of(context).scaffoldBackgroundColor,
        height: mediaQuery.size.height,
        width: mediaQuery.size.width,
        child: Column(
          children: [
            ChatDetailsParticipantsList(participants: chat.participants),
            const SizedBox(height: 10),
            Expanded(child: ChatDetailsTabBar(chat: chat)),
          ],
        ),
      ),
    );
  }
}

class _CustomScrollPhysics extends ScrollPhysics {
  /// Creates scroll physics that does not let the user scroll.
  const _CustomScrollPhysics({super.parent});

  @override
  _CustomScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return _CustomScrollPhysics(
      parent: buildParent(ancestor),
    );
  }

  @override
  bool get allowUserScrolling => false;
}
