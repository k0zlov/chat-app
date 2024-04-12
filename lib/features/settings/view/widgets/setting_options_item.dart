import 'package:chat_app/core/resources/icons.dart';
import 'package:chat_app/core/resources/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsMenuOption extends StatefulWidget {
  const SettingsMenuOption({
    super.key,
    required this.hasDivider,
    required this.title,
    required this.hasTopBorder,
    required this.hasBottomBorder,
    required this.onPressed,
    this.textColor,
    this.icon,
    this.iconData,
    this.trailingArrow = true,
    this.trailing,
  });

  final bool hasDivider;
  final bool hasTopBorder;
  final bool hasBottomBorder;
  final bool trailingArrow;
  final Widget? trailing;
  final Icon? icon;
  final AppIcons? iconData;
  final String title;
  final void Function()? onPressed;
  final Color? textColor;

  @override
  State<SettingsMenuOption> createState() => _SettingsMenuOptionState();
}

class _SettingsMenuOptionState extends State<SettingsMenuOption> {
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

    final Color backgroundColor =
        CupertinoTheme.of(context).brightness == Brightness.dark
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
        height: 52,
        width: MediaQuery.of(context).size.width,
        duration: const Duration(milliseconds: 10),
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
              padding: const EdgeInsets.all(10),
              child: widget.icon ??
                  (widget.iconData != null
                      ? Image.asset(widget.iconData!.path, height: 35)
                      : const SizedBox()),
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
  });

  final bool trailingArrow;
  final Widget? trailing;
  final String title;
  final bool hasDivider;
  final bool hasTopBorder;
  final bool hasBottomBorder;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    const Radius borderRadius = Radius.circular(15);

    const BorderSide borderSide = BorderSide(
      color: CupertinoColors.inactiveGray,
      width: 0.2,
    );

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
              Text(
                title,
                style: CupertinoTheme.of(context)
                    .textTheme
                    .textStyle
                    .copyWith(color: textColor),
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
