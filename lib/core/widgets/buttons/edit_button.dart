import 'package:chat_app/core/widgets/blur/blurred_widget.dart';
import 'package:flutter/cupertino.dart';

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
    required this.blur,
    required this.onPressed,
  });

  final bool blur;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BlurredWidget(
          blurred: blur,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
            color: blur ? CupertinoColors.black.withOpacity(0.2) : null,
            child: Text(
              'Edit',
              style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                    fontSize: 16,
                    color: blur
                        ? CupertinoColors.white
                        : CupertinoTheme.of(context).primaryColor,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
