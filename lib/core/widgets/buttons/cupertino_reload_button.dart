import 'package:flutter/cupertino.dart';

class CupertinoReloadButton extends StatelessWidget {
  const CupertinoReloadButton({
    super.key,
    required this.loading,
    required this.onLoading,
    this.showBackgroundColor = false,
  });

  final bool loading;
  final bool showBackgroundColor;

  final void Function()? onLoading;

  @override
  Widget build(BuildContext context) {
    final bool darkTheme =
        CupertinoTheme.of(context).brightness == Brightness.dark;

    final Color backgroundColor = loading
        ? CupertinoTheme.of(context).primaryColor
        : darkTheme
            ? CupertinoColors.darkBackgroundGray
            : CupertinoColors.lightBackgroundGray;

    final Widget widget = loading
        ? CupertinoActivityIndicator(
            color: showBackgroundColor ? CupertinoColors.white : null,
          )
        : CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: onLoading,
            minSize: 0,
            child: const Icon(CupertinoIcons.refresh, size: 20),
          );

    return showBackgroundColor
        ? Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(100),
            ),
            child: widget,
          )
        : widget;
  }
}
