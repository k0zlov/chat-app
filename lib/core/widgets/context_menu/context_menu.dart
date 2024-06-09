import 'package:chat_app/core/widgets/context_menu/context_menu_action.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContextMenu extends StatefulWidget {
  const ContextMenu({
    super.key,
    required this.actions,
    this.actionHeight = 50,
    this.animationAlignment,
    this.duration = const Duration(milliseconds: 220),
  });


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

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (_) async {
        await _animationController.reverse();
      },
      child: ScaleTransition(
        scale: _scaleAnimation,
        alignment: widget.animationAlignment ?? Alignment.center,
        child: SizedBox(
          height: widget.actionHeight * widget.actions.length + 20,
          width: 270,
          child: CupertinoListSection.insetGrouped(
            dividerMargin: 0,
            additionalDividerMargin: 0,
            backgroundColor: Colors.transparent,
            children: widget.actions,
          ),
        ),
      ),
    );
  }
}
