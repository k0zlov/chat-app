import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.title,
    required this.width,
    required this.height,
    required this.onPressed,
    required this.color,
  });

  final String title;
  final double width;
  final double height;
  final Color color;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          animationDuration: const Duration(milliseconds: 200),
        ),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
