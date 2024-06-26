import 'package:chat_app/core/widgets/blur/blurred_widget.dart';
import 'package:flutter/cupertino.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({
    super.key,
    required this.blurred,
    required this.onPressed,
    this.minimize = false,
  });

  final bool blurred;
  final bool minimize;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final textStyle = CupertinoTheme.of(context).textTheme.textStyle.copyWith(
          fontSize: 16,
          color: blurred
              ? CupertinoColors.white
              : CupertinoTheme.of(context).primaryColor,
        );

    return CupertinoButton(
      onPressed: onPressed,
      minSize: minimize ? 20 : kMinInteractiveDimensionCupertino,
      padding: minimize ? EdgeInsets.zero : null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BlurredWidget(
          blurred: blurred,
          child: Container(
            alignment: Alignment.center,
            color: blurred ? CupertinoColors.black.withOpacity(0.2) : null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.back,
                  color: blurred ? CupertinoColors.white : null,
                ),
                Visibility(
                  visible: !blurred,
                  replacement: const SizedBox(width: 4),
                  child: Text(
                    'Back',
                    style: textStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
