import 'dart:async';

import 'package:chat_app/core/navigation/navigation.dart';
import 'package:chat_app/features/auth/view/cubit/auth_cubit.dart';
import 'package:chat_app/features/chats/domain/entities/chat_entity/chat_entity.dart';
import 'package:chat_app/features/chats/domain/entities/chat_participant_entity/chat_participant_entity.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MiniChatScreenHeader extends StatefulWidget {
  const MiniChatScreenHeader({
    super.key,
    required this.image,
    required this.chat,
  });

  final ChatEntity chat;

  final Widget image;

  @override
  State<MiniChatScreenHeader> createState() => _MiniChatScreenHeaderState();
}

class _MiniChatScreenHeaderState extends State<MiniChatScreenHeader> {
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
    final theme = CupertinoTheme.of(context);

    final double width = MediaQuery.of(context).size.width * .95;

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
          fontSize: 12,
          color: subtitleGreenColor
              ? CupertinoColors.activeGreen
              : CupertinoColors.systemGrey,
        );

    return Container(
      height: 50,
      width: width,
      color: theme.barBackgroundColor.withOpacity(0.74),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              onTap: () => context.goNamed(
                AppRoutes.chat.name,
                pathParameters: {
                  'chatId': widget.chat.id.toString(),
                },
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(newChatTitle ?? widget.chat.title),
                  if (subtitle != null) ...{
                    Text(
                      subtitle,
                      style: textStyle,
                    ),
                  },
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: widget.image,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
