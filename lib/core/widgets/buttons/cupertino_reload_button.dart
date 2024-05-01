import 'package:flutter/cupertino.dart';

class CupertinoReloadButton extends StatelessWidget {
  const CupertinoReloadButton({
    super.key,
    required this.loading,
    required this.onLoading,
  });

  final bool loading;
  final void Function()? onLoading;

  @override
  Widget build(BuildContext context) {
    return loading
        ? const CupertinoActivityIndicator()
        : CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: onLoading,
            minSize: 0,
            child: const Icon(
              CupertinoIcons.refresh,
              size: 20,
            ),
          );
  }
}
