import 'package:chat_app/core/widgets/context_menu/context_menu.dart';
import 'package:chat_app/core/widgets/context_menu/context_menu_action.dart';
import 'package:chat_app/di_container.dart';
import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatTypeButton extends StatelessWidget {
  const ChatTypeButton({
    super.key,
    required this.onPressed,
    required this.type,
  });

  final ChatType type;

  final void Function(ChatType type) onPressed;

  void _showContextMenu(BuildContext context) {
    final RenderBox box = context.findRenderObject()! as RenderBox;
    final Offset position = box.localToGlobal(Offset.zero);
    final Size size = box.size;

    final Offset offset = Offset(
      position.dx + size.width,
      position.dy + size.height + 20,
    );

    final screenSize = MediaQuery.of(context).size;

    final double xFactor = (offset.dx < screenSize.width / 2) ? -1 : 1;

    final Alignment alignment = Alignment(
      xFactor,
      (offset.dy / screenSize.height) * 2 - 1,
    );

    const Duration duration = Duration(milliseconds: 220);

    showDialog<void>(
      context: context,
      useRootNavigator: false,
      barrierColor: Colors.transparent,
      builder: (context) {
        return BlocProvider.value(
          value: getIt<ChatsCubit>(),
          child: SizedBox(
            height: screenSize.height,
            width: screenSize.width,
            child: Align(
              alignment: alignment,
              child: _ChatTypeContextMenu(
                onPressed: onPressed,
                duration: duration,
                alignment: alignment,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = CupertinoTheme.of(context).textTheme.textStyle.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 16,
         );

    return SizedBox(
      height: 20,
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () => _showContextMenu(context),
        child: Text(type.name, style: textStyle),
      ),
    );
  }
}

class _ChatTypeContextMenu extends StatelessWidget {
  const _ChatTypeContextMenu({
    required this.duration,
    required this.alignment,
    required this.onPressed,
  });

  final Alignment alignment;

  final Duration duration;

  final void Function(ChatType type) onPressed;

  @override
  Widget build(BuildContext context) {
    return ContextMenu(
      duration: duration,
      animationAlignment: alignment,
      actions: [
        ContextMenuAction(
          title: 'group',
          onPressed: () => onPressed(ChatType.group),
        ),
        ContextMenuAction(
          title: 'channel',
          onPressed: () => onPressed(ChatType.channel),
        ),
      ],
    );
  }
}
