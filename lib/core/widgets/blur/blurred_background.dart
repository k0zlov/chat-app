import 'dart:ui';
import 'package:flutter/material.dart';

/// A widget that applies a Gaussian blur filter to its background,
/// creating a blurred effect behind its [child] widget.
///
/// This widget uses `BackdropFilter` from `dart:ui` to achieve the blur effect,
/// and it is wrapped inside a `ClipRect` to ensure the blur is applied only to the area occupied by this widget.
/// The blur intensity can be adjusted via the [blurAmount] parameter.
class BlurredBackground extends StatelessWidget {
  /// Creates a [BlurredBackground] widget.
  ///
  /// The [child] parameter must not be null and represents the widget
  /// that will be displayed on top of the blurred background.
  ///
  /// The [blurAmount] parameter is optional and defaults to 5.0. It controls
  /// the intensity of the Gaussian blur effect applied to the background.
  const BlurredBackground({
    required this.child,
    super.key,
    this.blurAmount = 5.0,
  });

  /// The widget to display on top of the blurred background.
  final Widget child;

  /// The intensity of the blur effect. Higher values make the background more blurred.
  ///
  /// This is achieved by setting the `sigmaX` and `sigmaY` parameters of the `ImageFilter.blur` method.
  /// A `sigma` value of 0 corresponds to no blur, and the effect becomes more pronounced as the value increases.
  final double blurAmount;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurAmount, sigmaY: blurAmount),
        child: ColoredBox(
          color: Colors.black.withOpacity(0.1),
          child: child,
        ),
      ),
    );
  }
}
