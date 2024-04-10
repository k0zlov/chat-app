import 'package:chat_app/core/widgets/blur/blurred_widget.dart';
import 'package:flutter/cupertino.dart';

class QrCodeButton extends StatelessWidget {
  const QrCodeButton({super.key, required this.blur});

  final bool blur;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BlurredWidget(
          blurred: blur,
          child: Container(
            padding: const EdgeInsets.all(4),
            color: blur ? CupertinoColors.black.withOpacity(0.2) : null,
            child: Icon(
              CupertinoIcons.qrcode,
              size: 30,
              color: blur
                  ? CupertinoColors.white
                  : CupertinoTheme.of(context).primaryColor,
            ),
          ),
        ),
      ),
      onPressed: () {},
    );
  }
}
