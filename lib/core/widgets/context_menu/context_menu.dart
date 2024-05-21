import 'package:chat_app/core/widgets/context_menu/context_menu_action.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContextMenu extends StatefulWidget {
  const ContextMenu({
    super.key,
    required this.visible,
    required this.actions,
    this.actionHeight = 50,
    this.animationAlignment,
    this.duration = const Duration(milliseconds: 220),
  });

  final bool visible;

  final Alignment? animationAlignment;

  final double actionHeight;

  final List<ContextMenuAction> actions;

  final Duration duration;

  @override
  State<ContextMenu> createState() => _ContextMenuState();
}

class _ContextMenuState extends State<ContextMenu>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
        reverseCurve: Curves.easeIn,
      ),
    );

    if (widget.visible) {
      _animationController.forward();
    }
  }

  @override
  void didUpdateWidget(covariant ContextMenu oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.visible == oldWidget.visible) return;

    if (widget.visible) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      alignment: widget.animationAlignment ?? Alignment.center,
      child: SizedBox(
        height: widget.actionHeight * widget.actions.length + 13,
        width: 270,
        child: CupertinoListSection.insetGrouped(
          dividerMargin: 0,
          additionalDividerMargin: 0,
          backgroundColor: Colors.transparent,
          children: widget.actions,
        ),
      ),
    );
  }
}
