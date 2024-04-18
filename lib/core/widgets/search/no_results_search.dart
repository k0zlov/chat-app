import 'package:chat_app/core/resources/palette.dart';
import 'package:flutter/cupertino.dart';

class NoResultsSearchWidget extends StatelessWidget {
  const NoResultsSearchWidget({
    super.key,
    required this.searchText,
  });

  final String searchText;

  @override
  Widget build(BuildContext context) {
    final Color textColor =
        CupertinoTheme.of(context).brightness == Brightness.dark
            ? AppPalette.darkText.withOpacity(0.5)
            : AppPalette.lightText.withOpacity(0.5);

    final textStyle = CupertinoTheme.of(context).textTheme.textStyle.copyWith(
          color: textColor,
          fontWeight: FontWeight.w400,
          fontSize: 12,
        );

    return DefaultTextStyle(
      style: textStyle.copyWith(fontSize: 16),
      child: Column(
        children: [
          const SizedBox(height: 100),
          Text('There were no results for "$searchText"'),
          const SizedBox(height: 4),
          const Text('Try a new search'),
        ],
      ),
    );
  }
}
