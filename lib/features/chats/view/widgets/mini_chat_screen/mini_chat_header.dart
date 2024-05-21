import 'package:flutter/cupertino.dart';

class MiniChatScreenHeader extends StatelessWidget {
  const MiniChatScreenHeader({
    super.key,
    required this.image,
    required this.title,
  });

  final String title;
  final Widget image;

  @override
  Widget build(BuildContext context) {
    final theme = CupertinoTheme.of(context);

    final double width = MediaQuery.of(context).size.width * .95;

    return Container(
      height: 50,
      width: width,
      color: theme.barBackgroundColor.withOpacity(0.74),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title),
                Text(
                  'last seen recently',
                  style: theme.textTheme.textStyle.copyWith(
                    fontSize: 12,
                    color: CupertinoColors.systemGrey,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: image,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
