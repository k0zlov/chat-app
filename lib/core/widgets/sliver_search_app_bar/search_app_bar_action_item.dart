import 'package:flutter/cupertino.dart';

class SearchAppBarActionItem extends StatelessWidget {
  const SearchAppBarActionItem({
    super.key,
    required this.child,
    required this.onPressed,
  });

  final Widget child;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
