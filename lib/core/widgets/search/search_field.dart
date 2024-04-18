import 'dart:math';

import 'package:flutter/cupertino.dart';

class ChatAppSearchField extends StatefulWidget {
  const ChatAppSearchField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    required this.onSubmitted,
    required this.text,
    this.onCancel,
    this.height = 42,
    this.width,
    this.reverseAnimation = true,
  });

  final String text;

  final double height;
  final double? width;

  final bool reverseAnimation;

  final TextEditingController controller;

  final FocusNode focusNode;

  final void Function(String text) onChanged;
  final void Function(String text) onSubmitted;
  final void Function()? onCancel;

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
      duration: const Duration(milliseconds: 220),
      reverseDuration: const Duration(milliseconds: 300),
    );

    _widthAnimation = Tween<double>(begin: 1, end: 1.2).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linearToEaseOut,
        reverseCurve: Curves.easeIn,
      ),
    );

    _paddingAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
        reverseCurve: Curves.fastEaseInToSlowEaseOut,
      ),
    );

    /// Starts animation when focused or unfocused
    widget.focusNode.addListener(_onFocus);
    widget.controller.addListener(_onType);
  }

  void _onFocus() {
    if (!mounted) return;

    if (widget.focusNode.hasFocus) {
      _animationController.forward();
    } else if (widget.controller.text == '') {
      if (!widget.reverseAnimation) return;
      _animationController.reverse();
    }
  }

  void _onType() {
    if (!mounted) return;

    if (!widget.reverseAnimation) return;

    if (!widget.focusNode.hasFocus && widget.controller.text == '') {
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
                    final double left = max(
                      10,
                      leftPadding * _paddingAnimation.value,
                    );

                    return SizedBox(
                      width: widgetWidth / _widthAnimation.value,
                      height: widget.height,
                      child: CupertinoTextField(
                        placeholder: 'Search',
                        placeholderStyle: const TextStyle(
                          inherit: false,
                          fontWeight: FontWeight.w400,
                          color: CupertinoColors.placeholderText,
                        ),
                        controller: widget.controller,
                        focusNode: widget.focusNode,
                        onChanged: widget.onChanged,
                        onSubmitted: widget.onSubmitted,
                        onTapOutside: (_) => widget.focusNode.unfocus(),
                        clearButtonMode: OverlayVisibilityMode.editing,
                        padding: EdgeInsets.only(
                          left: left,
                        ),
                        style: textStyle,
                        prefix: SizedBox(
                          width: 22,
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: left,
                                ),
                                child: const Icon(
                                  CupertinoIcons.search,
                                  color: CupertinoColors.inactiveGray,
                                ),
                              ),
                            ],
                          ),
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
                          widget.onChanged('');
                          widget.controller.clear();
                          widget.focusNode.unfocus();
                          widget.onCancel?.call();
                          if(!widget.reverseAnimation) {
                            _animationController.reverse();
                          }
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
