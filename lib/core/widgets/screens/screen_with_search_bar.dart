import 'package:flutter/cupertino.dart';

class ScreenWithSearchAppBar extends StatefulWidget {
  const ScreenWithSearchAppBar({
    super.key,
    required this.searchAppBar,
    required this.sliverBody,
    required this.focusNode,
    required this.searchWidget,
    required this.showSearchWidget,
  });

  final Widget searchAppBar;
  final Widget sliverBody;
  final FocusNode focusNode;
  final bool showSearchWidget;
  final Widget searchWidget;

  @override
  State<ScreenWithSearchAppBar> createState() => _ScreenWithSearchAppBarState();
}

class _ScreenWithSearchAppBarState extends State<ScreenWithSearchAppBar> {
  bool opacity = false;

  @override
  void initState() {
    super.initState();

    widget.focusNode.addListener(() {
      if (widget.focusNode.hasFocus == opacity) return;
      opacity = widget.focusNode.hasFocus;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      child: CustomScrollView(
        slivers: [
          widget.searchAppBar,
          if (widget.showSearchWidget) ...{
            widget.searchWidget,
          } else ...{
            SliverAnimatedOpacity(
              opacity: opacity ? 0.6 : 1,
              duration: const Duration(milliseconds: 220),
              sliver: widget.sliverBody,
            ),
          },
        ],
      ),
    );
  }
}
