import 'package:chat_app/core/widgets/buttons/pressable_scale_widget.dart';
import 'package:chat_app/di_container.dart';
import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:chat_app/features/chats/domain/entities/message_entity/message_entity.dart';
import 'package:chat_app/features/chats/view/screens/mini_chat_screen.dart';
import 'package:chat_app/features/chats/view/widgets/chat_screen/chat_default_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatsListItem extends StatelessWidget {
  const ChatsListItem({
    super.key,
    required this.title,
    required this.onPressed,
    required this.messages,
    this.draftText = '',
    this.subtitle,
    this.trailingText,
    this.leading,
    this.pinned = false,
    this.onLongPressWidget,
  });

  final String title;
  final String? subtitle;
  final String? trailingText;
  final String draftText;

  final bool pinned;

  final Widget? leading;

  final void Function() onPressed;
  final Widget? onLongPressWidget;

  final List<MessageEntity> messages;

  @override
  Widget build(BuildContext context) {
    final Color pinnedColor =
        CupertinoTheme.of(context).brightness == Brightness.dark
            ? CupertinoColors.white.withOpacity(0.05)
            : CupertinoColors.black.withOpacity(0.02);

    final Widget chatImage = leading ??
        ChatDefaultImage(
          title: title,
          size: 60,
        );

    return PressableScaleWidget(
      onLongPress: () {
        final RenderBox box = context.findRenderObject()! as RenderBox;
        final Offset position = box.localToGlobal(Offset.zero);
        final Size size = box.size;

        final centerOffset = Offset(
          position.dx + size.width / 2,
          position.dy + size.height / 2,
        );

        final screenSize = MediaQuery.of(context).size;

        final Alignment alignment = Alignment(
          (centerOffset.dx / screenSize.width) * 2 - 1,
          (centerOffset.dy / screenSize.height) * 2 - 1,
        );

        showCupertinoDialog<void>(
          context: context,
          barrierDismissible: true,
          builder: (context) =>
              onLongPressWidget ??
              BlocProvider.value(
                value: getIt<ChatsCubit>(),
                child: MiniChatScreen(
                  alignment: alignment,
                  title: title,
                  messages: messages,
                  chatImage: chatImage,
                ),
              ),
        );
      },
      child: CupertinoListTile(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        backgroundColor: pinned ? pinnedColor : Colors.transparent,
        leadingSize: 60,
        onTap: onPressed,
        leading: chatImage,
        title: _ChatsListItemTitle(
          title: title,
          subtitle: subtitle,
          draftText: draftText,
        ),
        trailing: _ChatsListItemTrailing(
          pinned: pinned,
          trailingText: trailingText,
        ),
      ),
    );
  }
}

class _ChatsListItemTitle extends StatelessWidget {
  const _ChatsListItemTitle({
    required this.title,
    required this.draftText,
    this.subtitle,
  });

  final String title;
  final String draftText;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final textStyle = CupertinoTheme.of(context).textTheme.textStyle;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textStyle.copyWith(
            fontSize: 16,
          ),
        ),
        if (draftText.isNotEmpty) ...{
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Draft: ',
                  style: textStyle.copyWith(color: CupertinoColors.systemRed),
                ),
                TextSpan(
                  text: draftText,
                  style: textStyle.copyWith(
                    color: CupertinoColors.systemGrey,
                  ),
                ),
              ],
            ),
          ),
        } else if (subtitle != null) ...{
          Text(
            subtitle!,
            style: textStyle.copyWith(
              color: CupertinoColors.systemGrey,
            ),
          ),
        },
      ],
    );
  }
}

class _ChatsListItemTrailing extends StatelessWidget {
  const _ChatsListItemTrailing({
    required this.pinned,
    this.trailingText,
  });

  final String? trailingText;
  final bool pinned;

  @override
  Widget build(BuildContext context) {
    final textStyle = CupertinoTheme.of(context).textTheme.textStyle;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (trailingText != null) ...{
          Text(
            trailingText!,
            style: textStyle.copyWith(color: CupertinoColors.systemGrey2),
          ),
        },
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Visibility(
            visible: pinned,
            replacement: const SizedBox(width: 17, height: 17),
            child: Transform.rotate(
              angle: 19.5,
              child: const Icon(
                CupertinoIcons.pin_fill,
                size: 17,
                color: CupertinoColors.inactiveGray,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
