import 'package:flutter/cupertino.dart';

class ChatActionsPanel extends StatelessWidget {
  const ChatActionsPanel({
    super.key,
    required this.blurred,
  });

  final bool blurred;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 74,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            ChatAction(
              blurred: blurred,
              title: 'mute',
              icon: CupertinoIcons.bell_fill,
              onPressed: () {},
              selected: true,
            ),
            ChatAction(
              blurred: blurred,
              title: 'search',
              icon: CupertinoIcons.search,
              onPressed: () {},
              selected: true,
            ),
            ChatAction(
              blurred: blurred,
              title: 'more',
              icon: CupertinoIcons.ellipsis,
              onPressed: () {},
              selected: true,
            ),
          ],
        ),
      ),
    );
  }
}

class ChatAction extends StatelessWidget {
  const ChatAction({
    super.key,
    required this.blurred,
    required this.title,
    required this.icon,
    required this.onPressed,
    required this.selected,
  });

  final String title;
  final IconData icon;

  final bool blurred;
  final bool selected;

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final Color color = CupertinoTheme.of(context).brightness == Brightness.dark
        ? CupertinoColors.darkBackgroundGray
        : CupertinoColors.white;

    final textStyle = CupertinoTheme.of(context).textTheme.textStyle.copyWith(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: blurred
              ? CupertinoColors.white
              : CupertinoTheme.of(context).primaryColor,
        );

    return Expanded(
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 240),
        opacity: selected ? 1 : 0.4,
        child: CupertinoButton(
          onPressed: onPressed,
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
          child: AnimatedContainer(
            height: 62,
            duration: const Duration(milliseconds: 240),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: blurred ? CupertinoColors.black.withOpacity(0.3) : color,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: blurred
                      ? CupertinoColors.white
                      : CupertinoTheme.of(context).primaryColor,
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: textStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
