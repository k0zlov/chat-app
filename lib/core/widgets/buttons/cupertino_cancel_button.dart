import 'package:flutter/cupertino.dart';

class CupertinoCancelButton extends StatelessWidget {
  const CupertinoCancelButton({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      child: const Text('Cancel'),
    );
  }
}
