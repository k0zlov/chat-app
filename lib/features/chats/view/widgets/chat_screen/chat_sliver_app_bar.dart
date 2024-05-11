import 'package:chat_app/core/navigation/navigation.dart';
import 'package:chat_app/core/widgets/blur/blurred_widget.dart';
import 'package:chat_app/core/widgets/buttons/app_bar_back_button.dart';
import 'package:chat_app/core/widgets/buttons/edit_button.dart';
import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:chat_app/features/chats/view/widgets/chat_screen/chat_actions_panel.dart';
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
  });

  final ChatEntity chat;
  final bool detailsMode;
  final void Function(bool newValue) setDetailsMode;
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

  final Duration toBasicDuration = const Duration(milliseconds: 300);
  final Duration toExpandedDuration = const Duration(milliseconds: 10);
  final Duration toCollapsedDuration = const Duration(milliseconds: 400);

  void _changeMode(AppBarMode newMode) {
    if (newMode == _mode) return;

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

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return SliverAppBar(
          backgroundColor: _mode.isCollapsed
              ? theme.barBackgroundColor
              : theme.scaffoldBackgroundColor,
          pinned: true,
          bottom: _mode.isCollapsed
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
          expandedHeight: _animationController.value,
          leading: AppBarBackButton(
            blurred: _mode.isExpanded,
            onPressed: _onBack,
          ),
          stretch: true,
          actions: [
            if (widget.detailsMode) ...{
              EditButton(blur: _mode.isExpanded, onPressed: () {}),
            },
          ],
          onStretchTrigger: () async {
            if (!widget.detailsMode) return;

            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              _changeMode(AppBarMode.expanded);
              _reloadHeight();
            });
          },
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            titlePadding: EdgeInsets.zero,
            centerTitle: true,
            background: _BackgroundWidget(
              mode: _mode,
              detailsMode: widget.detailsMode,
              onImagePressed: _onImage,
            ),
            expandedTitleScale: 1,
            title: SafeArea(
              child: BlurredWidget(
                blurred: _mode.isExpanded,
                child: SizedBox(
                  height: _mode.isCollapsed ? collapsedHeight : 130,
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        bottom:
                            _mode.isCollapsed || !widget.detailsMode ? 500 : 0,
                        curve: Curves.fastEaseInToSlowEaseOut,
                        duration: const Duration(milliseconds: 340),
                        child: ChatActionsPanel(blurred: _mode.isExpanded),
                      ),
                      _TitleWidget(
                        mode: _mode,
                        detailsMode: widget.detailsMode,
                        title: widget.chat.title,
                        onTitlePressed: widget.detailsMode ? null : _onTitle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    required this.title,
    required this.onTitlePressed,
    required this.mode,
    required this.detailsMode,
  });

  final String title;
  final bool detailsMode;
  final AppBarMode mode;
  final void Function()? onTitlePressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 240),
      height: 70,
      width: MediaQuery.of(context).size.width,
      alignment:
          mode.isExpanded ? Alignment.centerLeft : Alignment.bottomCenter,
      padding: mode.isExpanded
          ? const EdgeInsets.only(left: 14)
          : mode.isCollapsed
              ? EdgeInsets.zero
              : const EdgeInsets.only(bottom: 14),
      child: _TitleWidgetMainBody(
        title: title,
        mode: mode,
        onTitlePressed: onTitlePressed,
      ),
    );
  }
}

class _TitleWidgetMainBody extends StatelessWidget {
  const _TitleWidgetMainBody({
    required this.title,
    required this.mode,
    this.onTitlePressed,
  });

  final String title;
  final AppBarMode mode;
  final void Function()? onTitlePressed;

  @override
  Widget build(BuildContext context) {
    final textStyle = CupertinoTheme.of(context).textTheme.textStyle.copyWith(
          fontSize: 13,
        );

    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onTitlePressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: mode.isExpanded
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 240),
            style: textStyle.copyWith(
              fontSize: mode.isExpanded
                  ? 18
                  : mode.isCollapsed
                      ? 14
                      : 16,
              fontWeight: FontWeight.w500,
            ),
            child: Text(title),
          ),
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 240),
            style: textStyle.copyWith(
              fontSize: mode.isExpanded ? 14 : 12,
              color: mode.isExpanded ? null : CupertinoColors.inactiveGray,
            ),
            child: const Text('4 members, 2 online'),
          ),
        ],
      ),
    );
  }
}

class _BackgroundWidget extends StatelessWidget {
  const _BackgroundWidget({
    required this.detailsMode,
    required this.mode,
    required this.onImagePressed,
  });

  final bool detailsMode;
  final AppBarMode mode;

  final void Function() onImagePressed;

  @override
  Widget build(BuildContext context) {
    final double? size = mode.isBasic
        ? 100
        : mode.isExpanded
            ? null
            : 45;

    final EdgeInsets margin = mode.isExpanded
        ? EdgeInsets.zero
        : mode.isBasic
            ? const EdgeInsets.only(bottom: 60, right: 4)
            : const EdgeInsets.only(bottom: 6, right: 4);

    return AnimatedAlign(
      duration: const Duration(milliseconds: 550),
      alignment: detailsMode ? Alignment.center : Alignment.bottomRight,
      curve: Curves.fastEaseInToSlowEaseOut,
      child: GestureDetector(
        onTap: onImagePressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 800),
          curve: Curves.fastEaseInToSlowEaseOut,
          clipBehavior: Clip.hardEdge,
          height: size ?? MediaQuery.of(context).size.height,
          width: size ?? MediaQuery.of(context).size.width,
          margin: margin,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              mode.isExpanded ? 0 : 100,
            ),
          ),
          child: Image.network(
            'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
