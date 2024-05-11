import 'package:flutter/cupertino.dart';

class SettingsUserImage extends StatelessWidget {
  const SettingsUserImage({
    required this.expanded,
    required this.onImagePressed,
  });

  final bool expanded;
  final void Function() onImagePressed;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Hero(
      tag: 'settings_user_image',
      child: Align(
        child: GestureDetector(
          onTap: onImagePressed,
          child: AnimatedContainer(
            curve: Curves.fastEaseInToSlowEaseOut,
            clipBehavior: Clip.hardEdge,
            duration: const Duration(milliseconds: 240),
            height: expanded ? screenSize.height : 110,
            width: expanded ? screenSize.width : 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(expanded ? 0 : 100),
            ),
            child: Image.network(
              'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
