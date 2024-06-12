import 'package:chat_app/core/navigation/navigation.dart';
import 'package:chat_app/core/widgets/buttons/app_bar_back_button.dart';
import 'package:chat_app/core/widgets/buttons/edit_button.dart';
import 'package:chat_app/core/widgets/search/search_field.dart';
import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:chat_app/features/chats/view/widgets/chat_details_screen/mini_messages_search_button.dart';
import 'package:chat_app/features/chats/view/widgets/chat_screen/chat_app_bar_flexible_space.dart';
import 'package:chat_app/features/settings/view/widgets/settings_screen/settings_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';

class ChatSliverAppBar extends StatefulWidget {
  const ChatSliverAppBar({
    super.key,
    required this.chat,
    required this.detailsMode,
    required this.setDetailsMode,
    required this.scrollController,
    required this.searchMode,
    required this.focusNode,
    required this.activateSearchMode,
    required this.deactivateSearchMode,
    required this.searchText,
    required this.onSearchChanged,
  });

  final ChatEntity chat;

  final FocusNode focusNode;

  final String searchText;

  final bool detailsMode;
  final bool searchMode;

  final void Function(bool newValue) setDetailsMode;
  final void Function() activateSearchMode;
  final void Function() deactivateSearchMode;
  final void Function(String text) onSearchChanged;

  final ScrollController scrollController;

  @override
  State<ChatSliverAppBar> createState() => _ChatSliverAppBarState();
}

class _ChatSliverAppBarState extends State<ChatSliverAppBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  AppBarMode _mode = AppBarMode.collapsed;

  final double basicHeight = 280;
  final double expandedHeight = 440;
  final double collapsedHeight = 70;

  final Duration toBasicDuration = const Duration(milliseconds: 400);
  final Duration toExpandedDuration = const Duration(milliseconds: 20);
  final Duration toCollapsedDuration = const Duration(milliseconds: 240);

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      lowerBound: collapsedHeight,
      upperBound: expandedHeight,
      vsync: this,
    );

    widget.scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _changeMode(AppBarMode newMode) {
    if (newMode == _mode) return;

    if (widget.chat.type == ChatType.savedMessages) return;

    _mode = newMode;
    setState(() {});
  }

  void _changeDetailsMode(bool newValue) {
    if (newValue == widget.detailsMode) return;

    widget.setDetailsMode(newValue);
  }

  void _onBack() {
    if (widget.detailsMode) {
      _changeMode(AppBarMode.collapsed);
      _changeDetailsMode(false);
      _reloadHeight();
    } else {
      context.go(AppRoutes.chats.path);
    }
  }

  void _reloadHeight() {
    switch (_mode) {
      case AppBarMode.basic:
        _animationController.animateTo(
          basicHeight,
          duration: toBasicDuration,
        );
      case AppBarMode.expanded:
        _animationController.animateTo(
          expandedHeight,
          duration: toExpandedDuration,
        );
      case AppBarMode.collapsed:
        _animationController.animateTo(
          collapsedHeight,
          duration: toCollapsedDuration,
        );
    }
  }

  void _onTitle() {
    if (widget.detailsMode) return;

    _changeMode(AppBarMode.basic);
    _changeDetailsMode(true);
    _reloadHeight();
  }

  void _onImage() {
    if (!widget.detailsMode) {
      _changeDetailsMode(true);
      _changeMode(AppBarMode.expanded);
      _reloadHeight();
      return;
    }

    switch (_mode) {
      case AppBarMode.basic:
        _changeMode(AppBarMode.expanded);
      case AppBarMode.expanded:

      /// Implement Full Screen Image
      case AppBarMode.collapsed:
        _changeMode(AppBarMode.expanded);
    }
    _reloadHeight();
  }

  void _scrollListener() {
    final ScrollController scrollController = widget.scrollController;

    if (!scrollController.hasClients) return;

    _autoScroll();

    if (_onScrollDownStretched(scrollController)) return;

    if (_onCollapsed(scrollController)) return;

    if (_onBasic(scrollController)) return;
  }

  bool _onScrollDownStretched(ScrollController controller) {
    if (_mode != AppBarMode.expanded) return false;

    final ScrollDirection scrollDirection =
        controller.position.userScrollDirection;

    final bool scrollingDownwards = scrollDirection != ScrollDirection.forward;

    if (scrollingDownwards && _mode.isExpanded) {
      _changeMode(AppBarMode.basic);
      _reloadHeight();
      return true;
    }

    return false;
  }

  bool _onCollapsed(ScrollController controller) {
    if (_mode == AppBarMode.collapsed) return false;

    if (controller.offset > basicHeight - 100) {
      _changeMode(AppBarMode.collapsed);
      return true;
    }
    return false;
  }

  bool _onBasic(ScrollController controller) {
    if (_mode == AppBarMode.basic ||
        _mode == AppBarMode.expanded ||
        !widget.detailsMode) return false;

    if (controller.offset < basicHeight - 100) {
      _changeMode(AppBarMode.basic);
      return true;
    }
    return false;
  }

  void _autoScroll() {
    final ScrollController scrollController = widget.scrollController;

    if (!scrollController.hasClients) return;

    Future.delayed(const Duration(milliseconds: 50), () async {
      if (!widget.detailsMode) return;

      if (!scrollController.position.isScrollingNotifier.value) {
        final currentOffset = scrollController.offset;

        if (currentOffset < basicHeight - 100) {
          await scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        } else if (currentOffset > basicHeight - 100 &&
            currentOffset < basicHeight - 70) {
          await scrollController.animateTo(
            basicHeight - 70,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final CupertinoThemeData theme = CupertinoTheme.of(context);

    final Color borderColor =
        CupertinoTheme.of(context).brightness == Brightness.dark
            ? CupertinoColors.systemGrey
            : CupertinoColors.inactiveGray;

    final bool isSavedMessages = widget.chat.type == ChatType.savedMessages;

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return SliverAppBar(
          backgroundColor: _mode.isCollapsed
              ? theme.barBackgroundColor
              : theme.scaffoldBackgroundColor,
          pinned: true,
          bottom: widget.searchMode
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(0),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: ChatAppSearchField(
                      height: 40,
                      text: widget.searchText,
                      reverseAnimation: false,
                      controller: _controller,
                      focusNode: widget.focusNode,
                      onChanged: widget.onSearchChanged,
                      onSubmitted: (_) {},
                      onCancel: widget.deactivateSearchMode,
                    ),
                  ),
                )
              : _mode.isCollapsed
                  ? PreferredSize(
                      preferredSize: const Size.fromHeight(0.1),
                      child: Container(
                        height: 0.1,
                        width: double.infinity,
                        color: borderColor,
                        child: Divider(
                          thickness: 0.1,
                          color: borderColor,
                        ),
                      ),
                    )
                  : null,
          toolbarHeight: 70,
          leadingWidth: _mode.isExpanded ? 70 : 95,
          expandedHeight:
              isSavedMessages ? collapsedHeight : _animationController.value,
          leading: AppBarBackButton(
            blurred: _mode.isExpanded,
            onPressed: _onBack,
          ),
          stretch: !isSavedMessages,
          actions: [
            if (widget.detailsMode && !isSavedMessages) ...{
              EditButton(
                blur: _mode.isExpanded,
                onPressed: () => context.goNamed(
                  AppRoutes.chatEdit.name,
                  pathParameters: {
                    'chatId': widget.chat.id.toString(),
                  },
                ),
              ),
            } else if(isSavedMessages)...{
              MiniMessagesSearchButton(
                onPressed: widget.activateSearchMode,
              ),
            },
          ],
          onStretchTrigger: () async {
            if (!widget.detailsMode) return;

            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              _changeMode(AppBarMode.expanded);
              _reloadHeight();
            });
          },
          flexibleSpace: Visibility(
            visible: !widget.searchMode,
            child: ChatSliverAppBarFlexibleSpace(
              collapsedHeight: collapsedHeight,
              chat: widget.chat,
              mode: _mode,
              detailsMode: widget.detailsMode,
              onImagePressed: _onImage,
              onTitlePressed: _onTitle,
              activateSearchMode: () {
                _changeMode(AppBarMode.collapsed);
                _reloadHeight();
                widget.activateSearchMode();
              },
            ),
          ),
        );
      },
    );
  }
}
