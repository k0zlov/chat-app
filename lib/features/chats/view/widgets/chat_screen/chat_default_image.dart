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
    final textStyle = CupertinoTheme.of(context).textTheme.textStyle.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 30,
          color: CupertinoColors.white,
        );

    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: CupertinoColors.activeOrange,
        borderRadius: BorderRadius.circular(100),
      ),
      alignment: Alignment.center,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          title.substring(0, 1),
          style: textStyle,
        ),
      ),
    );
  }
}
