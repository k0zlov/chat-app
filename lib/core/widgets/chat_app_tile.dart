import 'package:chat_app/core/resources/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatAppTile extends StatefulWidget {
  const ChatAppTile({
    super.key,
    required this.hasDivider,
    required this.title,
    required this.hasTopBorder,
    required this.hasBottomBorder,
    required this.onPressed,
    this.textColor,
    this.trailingArrow = true,
    this.trailing,
    this.leading,
    this.backgroundColor,
    this.height = 52,
    this.leadingPadding = const EdgeInsets.all(10),
    this.padding = EdgeInsets.zero,
    this.subtitle,
  });

  final bool hasDivider;
  final bool hasTopBorder;
  final bool hasBottomBorder;
  final bool trailingArrow;
  final Widget? trailing;
  final Widget? leading;
  final String title;
  final void Function()? onPressed;
  final Color? textColor;
  final Color? backgroundColor;
  final double height;
  final EdgeInsets leadingPadding;
  final EdgeInsets padding;
  final String? subtitle;

  @override
  State<ChatAppTile> createState() => _ChatAppTileState();
}

class _ChatAppTileState extends State<ChatAppTile> {
  bool _tapped = false;

  void _onTap() {
    _tapped = true;
    setState(() {});
  }

  void _onTapCanceled() {
    _tapped = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const Radius borderRadius = Radius.circular(15);

    final Color backgroundColor = widget.backgroundColor != null
        ? widget.backgroundColor!
        : CupertinoTheme.of(context).brightness == Brightness.dark
            ? AppPalette.darkMenuOptionBackground
            : AppPalette.lightMenuOptionBackground;

    final Color selectedColor =
        CupertinoTheme.of(context).brightness == Brightness.dark
            ? AppPalette.darkSelected
            : AppPalette.lightSelected;

    final bool active = widget.onPressed != null;

    return GestureDetector(
      onTap: widget.onPressed,
      onTapDown: active ? (_) => _onTap() : null,
      onTapUp: active ? (_) => _onTapCanceled() : null,
      onTapCancel: _onTapCanceled,
      child: AnimatedContainer(
        height: widget.height,
        width: MediaQuery.of(context).size.width,
        duration: const Duration(milliseconds: 10),
        padding: widget.padding,
        decoration: BoxDecoration(
          color: _tapped ? selectedColor : backgroundColor,
          borderRadius: BorderRadius.vertical(
            top: widget.hasTopBorder ? borderRadius : Radius.zero,
            bottom: widget.hasBottomBorder ? borderRadius : Radius.zero,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: widget.leadingPadding,
              child: widget.leading ?? const SizedBox(),
            ),
            Expanded(
              child: _OptionBodyContainer(
                hasDivider: widget.hasDivider,
                title: widget.title,
                hasTopBorder: widget.hasTopBorder,
                hasBottomBorder: widget.hasBottomBorder,
                textColor: widget.textColor,
                trailingArrow: widget.trailingArrow,
                trailing: widget.trailing,
                subtitle: widget.subtitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OptionBodyContainer extends StatelessWidget {
  const _OptionBodyContainer({
    required this.hasDivider,
    required this.title,
    required this.hasTopBorder,
    required this.hasBottomBorder,
    required this.trailingArrow,
    this.textColor,
    this.trailing,
    required this.subtitle,
  });

  final bool trailingArrow;
  final Widget? trailing;
  final String title;
  final bool hasDivider;
  final bool hasTopBorder;
  final bool hasBottomBorder;
  final Color? textColor;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    const Radius borderRadius = Radius.circular(15);

    const BorderSide borderSide = BorderSide(
      color: CupertinoColors.inactiveGray,
      width: 0.2,
    );

    final textStyle = CupertinoTheme.of(context).textTheme.textStyle;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: constraints.maxHeight,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border(
              bottom: hasDivider ? borderSide : BorderSide.none,
            ),
            borderRadius: BorderRadius.only(
              topRight: hasTopBorder ? borderRadius : Radius.zero,
              bottomRight: hasBottomBorder ? borderRadius : Radius.zero,
              topLeft: const Radius.circular(1),
              bottomLeft: const Radius.circular(1),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: textStyle.copyWith(
                      color: textColor,
                    ),
                  ),
                  if (subtitle != null) ...{
                    Text(
                      subtitle!,
                      style: textStyle.copyWith(
                        fontSize: 12,
                        color: CupertinoColors.inactiveGray,
                      ),
                    ),
                  },
                ],
              ),
              Row(
                children: [
                  if (trailing != null) ...{
                    trailing!,
                  },
                  if (trailingArrow) ...{
                    const Icon(
                      CupertinoIcons.forward,
                      size: 20,
                      color: CupertinoColors.inactiveGray,
                    ),
                  },
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
