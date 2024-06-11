import 'package:chat_app/core/widgets/blur/blurred_widget.dart';
import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:chat_app/features/chats/view/widgets/chat_details_screen/chat_actions_panel.dart';
import 'package:chat_app/features/chats/view/widgets/chat_screen/chat_app_bar_image.dart';
import 'package:chat_app/features/settings/view/widgets/settings_screen/settings_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatSliverAppBarFlexibleSpace extends StatelessWidget {
  const ChatSliverAppBarFlexibleSpace({
    super.key,
    required this.activateSearchMode,
    required this.chat,
    required this.mode,
    required this.detailsMode,
    required this.onImagePressed,
    required this.collapsedHeight,
    required this.onTitlePressed,
  });

  final double collapsedHeight;

  final bool detailsMode;

  final AppBarMode mode;

  final ChatEntity chat;

  final void Function() activateSearchMode;
  final void Function() onImagePressed;
  final void Function() onTitlePressed;

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      collapseMode: CollapseMode.pin,
      titlePadding: EdgeInsets.zero,
      centerTitle: true,
      background: Hero(
        tag: chat.id,
        child: ChatAppBarImage(
          mode: mode,
          detailsMode: detailsMode,
          onImagePressed: onImagePressed,
        ),
      ),
      expandedTitleScale: 1,
      title: SafeArea(
        child: BlurredWidget(
          blurred: mode.isExpanded,
          child: SizedBox(
            height: mode.isCollapsed ? collapsedHeight : 140,
            child: Stack(
              children: [
                AnimatedPositioned(
                  bottom: mode.isCollapsed || !detailsMode ? 500 : 0,
                  curve: Curves.fastEaseInToSlowEaseOut,
                  duration: const Duration(milliseconds: 340),
                  child: ChatActionsPanel(
                    blurred: mode.isExpanded,
                    activateSearchMode: activateSearchMode,
                    chat: chat,
                  ),
                ),
                AnimatedAlign(
                  duration: const Duration(milliseconds: 240),
                  alignment: mode.isCollapsed
                      ? Alignment.bottomCenter
                      : Alignment.topCenter,
                  child: _TitleWidget(
                    mode: mode,
                    detailsMode: detailsMode,
                    chat: chat,
                    onTitlePressed: detailsMode ? null : onTitlePressed,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    required this.chat,
    required this.onTitlePressed,
    required this.mode,
    required this.detailsMode,
  });

  final ChatEntity chat;
  final bool detailsMode;
  final AppBarMode mode;
  final void Function()? onTitlePressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: const Duration(milliseconds: 140),
      padding: mode.isCollapsed
          ? EdgeInsets.zero
          : const EdgeInsets.only(bottom: 34),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 240),
        height: 85,
        width: MediaQuery.of(context).size.width,
        alignment: mode.isExpanded ? Alignment.topLeft : Alignment.center,
        padding:
            mode.isExpanded ? const EdgeInsets.only(left: 14) : EdgeInsets.zero,
        child: _TitleWidgetMainBody(
          chat: chat,
          mode: mode,
          onTitlePressed: onTitlePressed,
        ),
      ),
    );
  }
}

class _TitleWidgetMainBody extends StatelessWidget {
  const _TitleWidgetMainBody({
    required this.chat,
    required this.mode,
    this.onTitlePressed,
  });

  final ChatEntity chat;
  final AppBarMode mode;
  final void Function()? onTitlePressed;

  @override
  Widget build(BuildContext context) {
    final textStyle = CupertinoTheme.of(context).textTheme.textStyle.copyWith(
          fontSize: 13,
        );

    final int membersAmount = chat.participants.length;

    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onTitlePressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: mode.isExpanded
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          const Spacer(flex: 2),
          Expanded(
            flex: 2,
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: textStyle.copyWith(
                fontSize: mode.isExpanded ? 18 : 16,
                fontWeight: FontWeight.w500,
                color: mode.isExpanded ? CupertinoColors.white : null,
              ),
              child: Text(chat.title),
            ),
          ),
          Expanded(
            flex: 3,
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: textStyle.copyWith(
                fontSize: mode.isExpanded ? 14 : 12,
                color: mode.isExpanded
                    ? CupertinoColors.white
                    : CupertinoColors.inactiveGray,
              ),
              child: Text(
                '$membersAmount member${membersAmount == 1 ? '' : 's'}',
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
