import 'package:flutter/cupertino.dart';

class ChatDescription extends StatelessWidget {
  const ChatDescription({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = CupertinoTheme.of(context);

    final textStyle = theme.textTheme.textStyle.copyWith(
      color: CupertinoColors.systemGrey,
    );

    final Color color = theme.brightness == Brightness.dark
        ? CupertinoColors.darkBackgroundGray
        : CupertinoColors.white;

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(14),
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('description', style: textStyle),
          const SizedBox(height: 10),
          Text(description),
        ],
      ),
    );
  }
}
