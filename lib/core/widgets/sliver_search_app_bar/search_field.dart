import 'dart:math';

import 'package:flutter/cupertino.dart';

class ChatAppSearchField extends StatefulWidget {
  const ChatAppSearchField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    required this.onSubmitted,
    this.height = 42,
    this.width,
  });

  final double height;
  final double? width;
  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function(String text) onChanged;
  final void Function(String text) onSubmitted;

  @override
  State<ChatAppSearchField> createState() => _ChatAppSearchFieldState();
}

class _ChatAppSearchFieldState extends State<ChatAppSearchField>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late final Animation<double> _widthAnimation;
  late final Animation<double> _paddingAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 240),
      reverseDuration: const Duration(milliseconds: 220),
    );

    _widthAnimation = Tween<double>(begin: 1, end: 1.2).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutSine,
        reverseCurve: Curves.ease,
      ),
    );

    _paddingAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.decelerate,
        reverseCurve: Curves.ease,
      ),
    );

    /// Starts animation when focused or unfocused
    widget.focusNode.addListener(_onFocus);
  }

  void _onFocus() {
    if (widget.focusNode.hasFocus) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor =
        CupertinoTheme.of(context).brightness == Brightness.dark
            ? CupertinoColors.black
            : CupertinoColors.lightBackgroundGray;

    final TextStyle textStyle = CupertinoTheme.of(context).textTheme.textStyle;

    return LayoutBuilder(
      builder: (context, constraints) {
        final double widgetWidth = widget.width ?? constraints.maxWidth - 30;

        final double leftPadding = widgetWidth / 2 - 30;

        return SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return SizedBox(
                      width: widgetWidth / _widthAnimation.value,
                      height: widget.height,
                      child: CupertinoTextField(
                        controller: widget.controller,
                        focusNode: widget.focusNode,
                        onChanged: widget.onChanged,
                        onSubmitted: widget.onSubmitted,
                        placeholder: 'Search',
                        clearButtonMode: OverlayVisibilityMode.editing,
                        style: textStyle,
                        prefix: SizedBox(
                          width: 22,
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: max(
                                    10,
                                    leftPadding * _paddingAnimation.value,
                                  ),
                                ),
                                child: const Icon(
                                  CupertinoIcons.search,
                                  color: CupertinoColors.inactiveGray,
                                ),
                              ),
                            ],
                          ),
                        ),
                        padding: EdgeInsets.only(
                          left: max(10, leftPadding * _paddingAnimation.value),
                        ),
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  },
                ),
              ),
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(widgetWidth / _widthAnimation.value + 10, 0),
                    child: Opacity(
                      opacity: 1 - _paddingAnimation.value,
                      child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: Text(
                          'Cancel',
                          style: textStyle.copyWith(
                            fontSize: 16,
                            color: CupertinoTheme.of(context).primaryColor,
                          ),
                        ),
                        onPressed: () {
                          widget.focusNode.unfocus();
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
