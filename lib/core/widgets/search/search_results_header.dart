import 'package:chat_app/core/resources/palette.dart';
import 'package:flutter/cupertino.dart';

class SearchResultsHeader extends StatelessWidget {
  const SearchResultsHeader({
    super.key,
    required this.title,
  });

  final String title;

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

    return Container(
      height: 30,
      color: CupertinoTheme.of(context).scaffoldBackgroundColor,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Text(title, style: textStyle),
      ),
    );
  }
}
