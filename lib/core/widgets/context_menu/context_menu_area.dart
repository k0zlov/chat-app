import 'package:chat_app/core/widgets/buttons/pressable_scale_widget.dart';
import 'package:chat_app/core/widgets/context_menu/context_menu.dart';
import 'package:chat_app/core/widgets/context_menu/context_menu_action.dart';
import 'package:chat_app/di_container.dart';
import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContextMenuArea extends StatefulWidget {
  const ContextMenuArea({
    super.key,
    required this.child,
    required this.actions,
    required this.heroTag,
  });

  final Object heroTag;

  final Widget child;
  final List<ContextMenuAction> actions;

  @override
  State<ContextMenuArea> createState() => _ContextMenuAreaState();
}

class _ContextMenuAreaState extends State<ContextMenuArea> {
  bool _showMenu = false;

  final Duration _duration = const Duration(milliseconds: 240);

  void _setShowMenu(bool newValue) {
    if (_showMenu == newValue) return;

    _showMenu = newValue;
    setState(() {});
  }

  void _showContextMenu(BuildContext context) {
    final RenderBox renderBox = context.findRenderObject()! as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final double xCenter = position.dx + size.width / 2;
    final double yCenter = position.dy + size.height / 2;

    const double actionHeight = 50;
    final double contextMenuHeight = widget.actions.length * actionHeight;
    final double spaceBelow = screenHeight - yCenter - (size.height / 2);

    final bool shouldMove = spaceBelow - 50 < contextMenuHeight;

    final double adjustedChildYPosition = shouldMove
        ? position.dy - (contextMenuHeight - spaceBelow) - 50
        : position.dy;

    final Alignment alignment = Alignment(
      (xCenter / screenWidth) * 2 - 1,
      ((adjustedChildYPosition + size.height / 2) / screenHeight) * 2 - 1,
    );

    showCupertinoDialog<void>(
      context: context,
      useRootNavigator: false,
      barrierDismissible: true,
      builder: (context) {
        return BlocProvider.value(
          value: getIt<ChatsCubit>(),
          child: PopScope(
            onPopInvoked: (_) async {
              _setShowMenu(false);
              await Future.delayed(_duration, () {});
            },
            child: CupertinoPopupSurface(
              isSurfacePainted: false,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 220),
                    left: position.dx,
                    top: adjustedChildYPosition,
                    child: Visibility(
                      visible: _showMenu,
                      child: Hero(
                        tag: widget.heroTag,
                        child: widget.child,
                      ),
                    ),
                  ),
                  Positioned(
                    left: position.dx - 20,
                    top: adjustedChildYPosition + size.height - 10,
                    child: ContextMenu(
                      animationAlignment: alignment,
                      visible: _showMenu,
                      duration: _duration,
                      actions: widget.actions,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PressableScaleWidget(
      scaleWhenPressed: 0.9,
      onLongPress: () {
        if (_showMenu) return;

        _setShowMenu(true);
        Future.delayed(const Duration(milliseconds: 1), () {
          _showContextMenu(context);
        });
      },
      child: Visibility(
        visible: !_showMenu,
        maintainState: true,
        maintainAnimation: true,
        maintainSize: true,
        child: Hero(
          tag: widget.heroTag,
          child: widget.child,
        ),
      ),
    );
  }
}
