import 'package:flutter/cupertino.dart';

class AppBarSearchField extends StatefulWidget {
  const AppBarSearchField({
    super.key,
    required this.focusNode,
    required this.controller,
    required this.onChanged,
    required this.onSubmit,
  });

  final FocusNode focusNode;
  final TextEditingController controller;
  final void Function(String text) onChanged;
  final void Function(String text) onSubmit;

  @override
  State<AppBarSearchField> createState() => _AppBarSearchFieldState();
}

class _AppBarSearchFieldState extends State<AppBarSearchField> {
  bool get focused => widget.focusNode.hasFocus;

  @override
  void initState() {
    super.initState();

    widget.focusNode.addListener(
      () => setState(() {
        widget.controller.clear();
      }),
    );
    widget.controller.addListener(
      () => setState(() {}),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = CupertinoTheme.of(context).textTheme.textStyle;

    return GestureDetector(
      onTap: () => widget.focusNode.focusInDirection(TraversalDirection.up),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: _CustomTextField(
              focused: focused,
              controller: widget.controller,
              focusNode: widget.focusNode,
              onChanged: widget.onChanged,
              onSubmit: widget.onSubmit,
              showTitle: widget.controller.text == '',
            ),
          ),
          AnimatedPositioned(
            right: focused ? 0 : -90,
            bottom: 14,
            curve: Curves.fastEaseInToSlowEaseOut,
            duration: const Duration(milliseconds: 200),
            child: SizedBox(
              width: 100,
              child: CupertinoButton(
                onPressed: widget.focusNode.unfocus,
                child: Text(
                  'Cancel',
                  style: textStyle.copyWith(
                    fontSize: 18,
                    color: CupertinoTheme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomTextField extends StatelessWidget {
  const _CustomTextField({
    required this.focused,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    required this.onSubmit,
    required this.showTitle,
  });

  final bool focused;
  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function(String text) onChanged;
  final void Function(String text) onSubmit;
  final bool showTitle;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final TextStyle textStyle = CupertinoTheme.of(context).textTheme.textStyle;

    final Color backgroundColor =
        CupertinoTheme.of(context).brightness == Brightness.dark
            ? CupertinoColors.black
            : CupertinoColors.lightBackgroundGray;

    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          SizedBox(
            height: 42,
            width: focused ? screenWidth - 120 : screenWidth - 40,
            child: CupertinoTextField(
              controller: controller,
              focusNode: focusNode,
              onChanged: onChanged,
              padding: const EdgeInsets.only(left: 32, top: 8),
              style: textStyle.copyWith(fontSize: focused ? 16 : 0),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              onSubmitted: onSubmit,
            ),
          ),
          AnimatedPositioned(
            top: 5,
            left: focused ? 5 : MediaQuery.of(context).size.width / 3,
            duration: const Duration(milliseconds: 240),
            curve: Curves.fastEaseInToSlowEaseOut,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  CupertinoIcons.search,
                  size: 28,
                  color: CupertinoColors.systemGrey,
                ),
                SizedBox(width: focusNode.hasFocus ? 0 : 8),
                if (!focused || showTitle) ...{
                  Text(
                    'Search',
                    style: textStyle.copyWith(
                      color: CupertinoColors.systemGrey,
                      fontSize: 16,
                    ),
                  ),
                },
              ],
            ),
          ),
        ],
      ),
    );
  }
}
