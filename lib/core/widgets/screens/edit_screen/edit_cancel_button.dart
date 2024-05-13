import 'package:chat_app/core/widgets/buttons/cupertino_cancel_button.dart';
import 'package:flutter/cupertino.dart';

class EditScreenCancelButton extends StatelessWidget {
  const EditScreenCancelButton({
    super.key,
    required this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: CupertinoCancelButton(
        onPressed: onPressed,
      ),
    );
  }
}
