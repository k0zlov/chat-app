import 'package:flutter/cupertino.dart';

class PressableScaleWidget extends StatefulWidget {
  const PressableScaleWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<PressableScaleWidget> createState() => _PressableScaleWidgetState();
}

class _PressableScaleWidgetState extends State<PressableScaleWidget> {
  double _scale = 1;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scale = 0.96;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _scale = 1;
    });
  }

  void _onTapCancel() {
    setState(() {
      _scale = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: widget.child,
      ),
    );
  }
}
