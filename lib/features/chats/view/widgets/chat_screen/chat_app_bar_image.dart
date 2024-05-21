import 'package:chat_app/features/settings/view/widgets/settings_screen/settings_app_bar.dart';
import 'package:flutter/cupertino.dart';

class ChatAppBarImage extends StatelessWidget {
  const ChatAppBarImage({
    required this.detailsMode,
    required this.mode,
    required this.onImagePressed,
    this.useMargin = true,
  });

  final bool detailsMode;
  final bool useMargin;
  final AppBarMode mode;

  final void Function() onImagePressed;

  @override
  Widget build(BuildContext context) {
    final double? size = mode.isBasic
        ? 100
        : mode.isExpanded
            ? null
            : 45;

    final EdgeInsets margin = mode.isExpanded
        ? EdgeInsets.zero
        : mode.isBasic
            ? const EdgeInsets.only(bottom: 60, right: 4)
            : const EdgeInsets.only(bottom: 6, right: 4);

    return AnimatedAlign(
      duration: const Duration(milliseconds: 550),
      alignment: detailsMode ? Alignment.center : Alignment.bottomRight,
      curve: Curves.fastEaseInToSlowEaseOut,
      child: GestureDetector(
        onTap: onImagePressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 650),
          curve: Curves.fastEaseInToSlowEaseOut,
          clipBehavior: Clip.hardEdge,
          height: size ?? MediaQuery.of(context).size.height,
          width: size ?? MediaQuery.of(context).size.width,
          margin: useMargin ? margin : EdgeInsets.zero,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              mode.isExpanded ? 0 : 100,
            ),
          ),
          child: Image.network(
            'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
