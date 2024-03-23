import 'package:chat_app/core/widgets/blur/blurred_background.dart';
import 'package:flutter/cupertino.dart';

class BlurredBackgroundLoading extends StatelessWidget {
  const BlurredBackgroundLoading({
    super.key,
    required this.backgroundWidget,
  });

  final Widget backgroundWidget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        backgroundWidget,
        const BlurredBackground(
          child: Center(child: CupertinoActivityIndicator(radius: 16)),
        ),
      ],
    );
  }
}
