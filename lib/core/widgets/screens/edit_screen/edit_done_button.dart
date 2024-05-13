import 'package:chat_app/core/widgets/buttons/cupertino_done_button.dart';
import 'package:flutter/cupertino.dart';

class EditScreenDoneButton extends StatelessWidget {
  const EditScreenDoneButton({
    super.key,
    required this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: CupertinoDoneButton(
        onPressed: onPressed,
      ),
    );
  }
}
