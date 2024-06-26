import 'package:chat_app/core/navigation/navigation.dart';
import 'package:chat_app/features/auth/auth_feature.dart';
import 'package:chat_app/features/auth/domain/entities/user_entity/user_entity.dart';
import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:chat_app/features/chats/domain/entities/chat_participant_entity/chat_participant_entity.dart';
import 'package:chat_app/features/chats/domain/entities/message_entity/message_entity.dart';
import 'package:chat_app/features/chats/view/widgets/chat_details_screen/details_participants_list.dart';
import 'package:chat_app/features/chats/view/widgets/chat_details_screen/details_tab_bar.dart';
import 'package:chat_app/features/chats/view/widgets/chat_screen/chat_bottom_bar.dart';
import 'package:chat_app/features/chats/view/widgets/chat_details_screen/chat_description.dart';
import 'package:chat_app/features/chats/view/widgets/chat_screen/chat_messages.dart';
import 'package:chat_app/features/chats/view/widgets/chat_screen/chat_sliver_app_bar.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
  bool _searchMode = false;

  String _searchText = '';

  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();

  void _onSearchText(String text) {
    if (_searchText == text) return;

    _searchText = text;
    setState(() {});
  }

  void _setDetailsMode(bool newValue) {
    if (_detailsMode == newValue) return;

    _detailsMode = newValue;
    _searchMode = false;
    setState(() {});
    Future.delayed(const Duration(milliseconds: 20), () {
      _scrollController.jumpTo(0);
    });
  }

  void _setSearchMode(bool newValue) {
    if (_searchMode == newValue) return;

    _searchMode = newValue;
    _detailsMode = false;
    setState(() {});
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ChatsState state = context.select((ChatsCubit cubit) => cubit.state);

    bool viewingSearchedChat = false;

    ChatEntity? chat = state.chats.firstWhereOrNull(
      (chat) => chat.id == widget.chatId,
    );

    if (chat == null) {
      chat = state.searchedChats.firstWhereOrNull(
        (chat) => chat.id == widget.chatId,
      );
      viewingSearchedChat = true;
    }

    if (chat == null) {
      Future.microtask(() {
        context.goNamed(AppRoutes.chats.name);
      });
      return const SizedBox();
    }

    final mediaQuery = MediaQuery.of(context);

    final double bottomPadding =
        mediaQuery.viewInsets.bottom + mediaQuery.padding.bottom;

    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      child: CustomScrollView(
        controller: _scrollController,
        physics:
            _detailsMode ? const ScrollPhysics() : const _CustomScrollPhysics(),
        slivers: [
          ChatSliverAppBar(
            chat: chat,
            onSearchChanged: _onSearchText,
            searchText: _searchText,
            focusNode: _focusNode,
            searchMode: _searchMode,
            detailsMode: _detailsMode,
            scrollController: _scrollController,
            setDetailsMode: _setDetailsMode,
            deactivateSearchMode: () {
              _focusNode.unfocus();
              _setSearchMode(false);
            },
            activateSearchMode: () {
              _setSearchMode(true);
              Future.delayed(
                const Duration(milliseconds: 30),
                _focusNode.requestFocus,
              );
            },
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    curve: Curves.decelerate,
                    bottom: bottomPadding,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    duration: const Duration(milliseconds: 240),
                    child: _ChatScreenMainBody(
                      chat: chat,
                      searchText: _searchText,
                      searchMode: _searchMode,
                      showJoinChat: viewingSearchedChat,
                    ),
                  ),
                  AnimatedPositioned(
                    left: _detailsMode ? 0 : mediaQuery.size.width,
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 300),
                    child: _ChatScreenDetailsBody(chat: chat),
                  ),
                ],
              ),
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
    required this.searchMode,
    required this.searchText,
    required this.showJoinChat,
  });

  final String searchText;

  final ChatEntity chat;
  final bool searchMode;
  final bool showJoinChat;

  @override
  Widget build(BuildContext context) {
    final List<MessageEntity> messages = chat.messages.where(
      (message) {
        return message.content.toLowerCase().contains(searchText.toLowerCase());
      },
    ).toList();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ChatMessages(
          chatType: chat.type,
          messages: searchMode ? messages : chat.messages,
          height: MediaQuery.of(context).size.height - kToolbarHeight - 110,
        ),
        ChatBottomBar(
          chat: chat,
          searchMode: searchMode,
          showJoinChat: showJoinChat,
        ),
      ],
    );
  }
}

class _ChatScreenDetailsBody extends StatelessWidget {
  const _ChatScreenDetailsBody({
    required this.chat,
  });

  final ChatEntity chat;

  bool _checkDescription(String? description) {
    if (description == null) return false;

    if (description.isEmpty) return false;

    if (description.trim().isEmpty) return false;

    return true;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final UserEntity currentUser =
        context.select((AuthCubit cubit) => cubit.state).currentUser;

    final ChatParticipantEntity? participant =
        chat.participants.firstWhereOrNull((e) => e.userId != currentUser.id);

    final String? description =
        chat.type.isPrivate ? participant?.bio : chat.description;

    final bool showParticipantsList = chat.type.isGroup || chat.type.isChannel;

    final bool showDescription =
        chat.type != ChatType.savedMessages && _checkDescription(description);

    return SingleChildScrollView(
      child: Container(
        color: CupertinoTheme.of(context).scaffoldBackgroundColor,
        height: mediaQuery.size.height,
        width: mediaQuery.size.width,
        child: Column(
          children: [
            if (showParticipantsList) ...{
              ChatDetailsParticipantsList(participants: chat.participants),
            },
            if (showDescription) ...{
              ChatDescription(
                isBio: chat.type.isPrivate,
                description: description!,
              ),
            },
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
