import 'package:flutter/cupertino.dart';

class ChatScrollDownButton extends StatefulWidget {
  const ChatScrollDownButton({
    super.key,
    required this.onPressed,
    required this.scrollController,
  });

  final ScrollController scrollController;
  final void Function()? onPressed;

  @override
  State<ChatScrollDownButton> createState() => _ChatScrollDownButtonState();
}

class _ChatScrollDownButtonState extends State<ChatScrollDownButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 240),
    );

    _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    widget.scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (!widget.scrollController.hasClients) return;

    if (widget.scrollController.offset > 30) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = CupertinoTheme.of(context);

    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: DecoratedBox(
            position: DecorationPosition.foreground,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.fromBorderSide(
                BorderSide(
                  width: 0.1,
                  color: CupertinoColors.inactiveGray.withOpacity(0.6),
                ),
              ),
            ),
            child: CupertinoButton(
              color: theme.barBackgroundColor.withOpacity(0.9),
              borderRadius: BorderRadius.circular(25),
              padding: EdgeInsets.zero,
              onPressed: widget.onPressed,
              child: Icon(
                CupertinoIcons.chevron_down,
                size: 26,
                color: theme.primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
