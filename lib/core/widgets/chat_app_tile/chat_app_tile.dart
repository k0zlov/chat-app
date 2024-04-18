import 'package:chat_app/core/widgets/buttons/pressable_scale_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatAppTile extends StatefulWidget {
  const ChatAppTile({
    super.key,
    required this.title,
    this.trailingArrow = false,
    this.divider = false,
    this.roundedTopBorder = false,
    this.roundedBottomBorder = false,
    this.pressScale = false,
    this.padding,
    this.bodyPadding = EdgeInsets.zero,
    this.titlePadding = EdgeInsets.zero,
    this.leadingPadding = EdgeInsets.zero,
    this.backgroundColor,
    this.leading,
    this.trailing,
    this.onTap,
    this.onLongPress,
    this.height = 52,
    this.width = double.infinity,
    this.leadingSpacing,
    this.pressedOpacity = 0.4,
  });

  final double height;
  final double width;
  final double? leadingSpacing;
  final double? pressedOpacity;

  final Widget title;
  final Widget? leading;
  final Widget? trailing;

  final bool trailingArrow;
  final bool divider;
  final bool roundedTopBorder;
  final bool roundedBottomBorder;
  final bool pressScale;

  final EdgeInsets? padding;
  final EdgeInsets bodyPadding;
  final EdgeInsets titlePadding;
  final EdgeInsets leadingPadding;

  final Color? backgroundColor;

  final void Function()? onTap;
  final void Function()? onLongPress;

  @override
  State<ChatAppTile> createState() => _ChatAppTileState();
}

class _ChatAppTileState extends State<ChatAppTile> {
  bool _pressed = false;

  void _onTapDown() {
    if (_pressed) return;
    _pressed = true;
    setState(() {});
  }

  void _onTapUp() {
    if (!_pressed) return;

    _pressed = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _ChatAppTileStructure mainBodyWidget = _ChatAppTileStructure(
      title: widget.title,
      trailing: widget.trailing,
      leading: widget.leading,
      divider: widget.divider,
      trailingArrow: widget.trailingArrow,
      leadingSpacing: widget.leadingSpacing,
      leadingPadding: widget.leadingPadding,
      titlePadding: widget.titlePadding,
      bodyPadding: widget.bodyPadding,
    );

    const Radius borderRadius = Radius.circular(15);

    final Color widgetColor = widget.backgroundColor ??
        CupertinoTheme.of(context).scaffoldBackgroundColor;

    final Color selectedColor =
        CupertinoTheme.of(context).brightness == Brightness.dark
            ? Color.alphaBlend(Colors.white.withOpacity(0.1), widgetColor)
            : Color.alphaBlend(Colors.black.withOpacity(0.1), widgetColor);

    return GestureDetector(
      onTap: widget.onTap,
      onLongPress: widget.onLongPress,
      onTapUp: (_) => _onTapUp(),
      onTapDown: (_) => _onTapDown(),
      onTapCancel: _onTapUp,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 60),
        height: widget.height,
        width: widget.width,
        padding: widget.padding,
        decoration: BoxDecoration(
          color: _pressed ? selectedColor : widget.backgroundColor,
          borderRadius: BorderRadius.vertical(
            top: widget.roundedTopBorder ? borderRadius : Radius.zero,
            bottom: widget.roundedBottomBorder ? borderRadius : Radius.zero,
          ),
        ),
        child: widget.pressScale && widget.onLongPress != null
            ? PressableScaleWidget(child: mainBodyWidget)
            : mainBodyWidget,
      ),
    );
  }
}

class _ChatAppTileStructure extends StatelessWidget {
  const _ChatAppTileStructure({
    required this.title,
    required this.trailingArrow,
    required this.divider,
    required this.bodyPadding,
    required this.leadingPadding,
    required this.titlePadding,
    this.leading,
    this.trailing,
    this.leadingSpacing,
  });

  final double? leadingSpacing;

  final Widget title;
  final Widget? leading;
  final Widget? trailing;

  final EdgeInsets bodyPadding;
  final EdgeInsets titlePadding;
  final EdgeInsets leadingPadding;

  final bool trailingArrow;
  final bool divider;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: CupertinoTheme.of(context).textTheme.textStyle,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: leadingPadding,
            child: SizedBox(
              height: leadingSpacing,
              width: leadingSpacing,
              child: leading,
            ),
          ),
          Expanded(
            child: Container(
              padding: bodyPadding,
              decoration: BoxDecoration(
                border: Border(
                  bottom: divider
                      ? const BorderSide(
                          width: 0.1,
                          color: CupertinoColors.inactiveGray,
                        )
                      : BorderSide.none,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  title,
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Row(
                      children: [
                        trailing ?? const SizedBox(),
                        if (trailingArrow) ...{
                          const Icon(
                            CupertinoIcons.forward,
                            size: 20,
                            color: CupertinoColors.inactiveGray,
                          ),
                        },
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
