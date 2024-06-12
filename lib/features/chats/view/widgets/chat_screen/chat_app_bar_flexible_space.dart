import 'dart:async';

import 'package:chat_app/core/widgets/blur/blurred_widget.dart';
import 'package:chat_app/features/auth/view/cubit/auth_cubit.dart';
import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:chat_app/features/chats/domain/entities/chat_participant_entity/chat_participant_entity.dart';
import 'package:chat_app/features/chats/view/widgets/chat_details_screen/chat_actions_panel.dart';
import 'package:chat_app/features/chats/view/widgets/chat_screen/chat_app_bar_image.dart';
import 'package:chat_app/features/settings/view/widgets/settings_screen/settings_app_bar.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final bool isSavedMessages = chat.type == ChatType.savedMessages;

    return FlexibleSpaceBar(
      collapseMode: CollapseMode.pin,
      titlePadding: EdgeInsets.zero,
      centerTitle: true,
      background: isSavedMessages
          ? null
          : Hero(
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
            height: isSavedMessages
                ? collapsedHeight
                : mode.isCollapsed
                    ? collapsedHeight
                    : 140,
            child: Stack(
              children: [
                if (!isSavedMessages) ...{
                  AnimatedPositioned(
                    bottom: mode.isCollapsed || !detailsMode ? 500 : 0,
                    curve: Curves.fastEaseInToSlowEaseOut,
                    duration: const Duration(milliseconds: 220),
                    child: ChatActionsPanel(
                      blurred: mode.isExpanded,
                      activateSearchMode: activateSearchMode,
                      chat: chat,
                    ),
                  ),
                },
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

class _TitleWidgetMainBody extends StatefulWidget {
  const _TitleWidgetMainBody({
    required this.chat,
    required this.mode,
    this.onTitlePressed,
  });

  final ChatEntity chat;
  final AppBarMode mode;
  final void Function()? onTitlePressed;

  @override
  State<_TitleWidgetMainBody> createState() => _TitleWidgetMainBodyState();
}

class _TitleWidgetMainBodyState extends State<_TitleWidgetMainBody> {
  late Timer _timer;
  late DateTime _currentTime;

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int membersAmount = widget.chat.participants.length;

    final int userId =
        context.select((AuthCubit cubit) => cubit.state).currentUser.id;

    String? subtitle;
    String? newChatTitle;
    bool subtitleGreenColor = false;

    switch (widget.chat.type) {
      case ChatType.private:
        {
          final ChatParticipantEntity? participant =
              widget.chat.participants.firstWhereOrNull(
            (p) => p.userId != userId,
          );

          if (participant != null) {
            final Duration difference = _currentTime.difference(
              participant.lastActivityAt!,
            );

            final bool isOnline = difference.inMinutes <= 5;

            newChatTitle = participant.name;

            if (isOnline) {
              subtitle = 'online';
              subtitleGreenColor = true;
            } else {
              subtitle = 'last seen ${difference.inMinutes} min ago';
            }
          } else {
            subtitle = 'last seen recently';
          }
        }
      case ChatType.group:
        {
          subtitle = '$membersAmount member${membersAmount == 1 ? '' : 's'}';
        }
      case ChatType.channel:
        subtitle = '$membersAmount subscriber${membersAmount == 1 ? '' : 's'}';
      case ChatType.savedMessages:
    }

    final textStyle = CupertinoTheme.of(context).textTheme.textStyle.copyWith(
          fontSize: 13,
        );

    return CupertinoButton(
      padding: EdgeInsets.only(bottom: subtitle == null ? 10 : 0),
      onPressed: widget.onTitlePressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: widget.mode.isExpanded
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          const Spacer(flex: 2),
          Expanded(
            flex: 3,
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: textStyle.copyWith(
                fontSize: widget.mode.isExpanded ? 18 : 16,
                fontWeight: FontWeight.w500,
                color: widget.mode.isExpanded ? CupertinoColors.white : null,
              ),
              child: Text(newChatTitle ?? widget.chat.title),
            ),
          ),
          if (subtitle != null) ...{
            Expanded(
              flex: 3,
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: textStyle.copyWith(
                  fontSize: widget.mode.isExpanded ? 14 : 12,
                  color: subtitleGreenColor
                      ? CupertinoColors.activeGreen
                      : widget.mode.isExpanded
                          ? CupertinoColors.white
                          : CupertinoColors.inactiveGray,
                ),
                child: Text(subtitle),
              ),
            ),
          },
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
