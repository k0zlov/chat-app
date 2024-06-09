
import 'package:flutter/cupertino.dart';

class ChatDefaultImage extends StatelessWidget {
  const ChatDefaultImage({
    super.key,
    required this.title,
    required this.size,
  });

  final String title;
  final double size;

  @override
  Widget build(BuildContext context) {
    final String letter = title.substring(0, 1).toUpperCase();

    final Map<String, Color> letterColors = {
      'A': CupertinoColors.systemRed,
      'B': CupertinoColors.systemGreen,
      'C': CupertinoColors.activeOrange,
      'D': CupertinoColors.systemIndigo,
      'E': CupertinoColors.systemTeal,
      'F': CupertinoColors.systemYellow,
      'T': CupertinoColors.systemPink,
    };

    final Color color = letterColors[letter] ?? CupertinoColors.systemGrey;

    final textStyle = CupertinoTheme.of(context).textTheme.textStyle.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 30,
          color: CupertinoColors.white,
        );

    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100),
      ),
      alignment: Alignment.center,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Center(
          child: Text(
            letter,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
