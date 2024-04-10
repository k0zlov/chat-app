import 'dart:ui';

import 'package:flutter/cupertino.dart';

class BlurredWidget extends StatelessWidget {
  const BlurredWidget({
    super.key,
    required this.blurred,
    required this.child,
  });

  final bool blurred;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: blurred ? 10 : 0,
          sigmaY: blurred ? 30 : 0,
        ),
        child: child,
      ),
    );
  }
}