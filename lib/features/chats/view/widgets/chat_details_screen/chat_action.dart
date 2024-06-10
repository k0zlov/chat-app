import 'package:chat_app/core/widgets/context_menu/context_menu.dart';
import 'package:chat_app/core/widgets/context_menu/context_menu_action.dart';
import 'package:chat_app/di_container.dart';
import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatActionData {
  const ChatActionData({
    required this.title,
    required this.iconData,
    required this.contextMenuActions,
    this.onPressed,
  });

  final String title;
  final IconData iconData;
  final List<ContextMenuAction> contextMenuActions;
  final void Function()? onPressed;
}

class ChatAction extends StatelessWidget {
  const ChatAction({
    super.key,
    required this.index,
    required this.blurred,
    required this.title,
    required this.icon,
    required this.selectAction,
    required this.selected,
    this.contextMenuActions,
    this.onPressed,
  });

  final int index;

  final String title;
  final IconData icon;

  final bool blurred;
  final bool selected;

  final void Function()? onPressed;
  final void Function(int index) selectAction;

  final List<ContextMenuAction>? contextMenuActions;

  void _showContextMenu(BuildContext context) {
    if (contextMenuActions == null || contextMenuActions!.isEmpty) return;

    final RenderBox box = context.findRenderObject()! as RenderBox;
    final Offset position = box.localToGlobal(Offset.zero);
    final Size size = box.size;

    final Offset offset = Offset(
      position.dx + size.width,
      position.dy + size.height + 40,
    );

    final screenSize = MediaQuery.of(context).size;

    final double xFactor = (offset.dx < screenSize.width / 2) ? -1 : 1;

    final Alignment alignment = Alignment(
      xFactor,
      (offset.dy / screenSize.height) * 2 - 1,
    );

    const Duration duration = Duration(milliseconds: 240);

    showDialog<void>(
      context: context,
      useRootNavigator: false,
      barrierColor: Colors.transparent,
      builder: (context) {
        return BlocProvider.value(
          value: getIt<ChatsCubit>(),
          child: PopScope(
            onPopInvoked: (_) async {
              selectAction(-1);
              await Future.delayed(duration, () {});
            },
            child: SizedBox(
              height: screenSize.height,
              width: screenSize.width,
              child: Align(
                alignment: alignment,
                child: ContextMenu(
                  duration: duration,
                  animationAlignment: Alignment.topCenter,
                  actions: contextMenuActions!,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color color = CupertinoTheme.of(context).brightness == Brightness.dark
        ? CupertinoColors.darkBackgroundGray
        : CupertinoColors.white;

    final textStyle = CupertinoTheme.of(context).textTheme.textStyle.copyWith(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: blurred
              ? CupertinoColors.white
              : CupertinoTheme.of(context).primaryColor,
        );

    return Expanded(
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 220),
        opacity: selected ? 1 : 0.4,
        child: CupertinoButton(
          onPressed: () {
            if (onPressed != null) {
              onPressed!.call();
              return;
            }
            if (contextMenuActions == null || contextMenuActions!.isEmpty) {
              return;
            }
            selectAction(index);
            _showContextMenu(context);
          },
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
          child: AnimatedContainer(
            height: 62,
            duration: const Duration(milliseconds: 220),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: blurred ? CupertinoColors.black.withOpacity(0.3) : color,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: blurred
                      ? CupertinoColors.white
                      : CupertinoTheme.of(context).primaryColor,
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: textStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
