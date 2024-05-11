import 'package:chat_app/core/resources/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatBackgroundImage extends StatelessWidget {
  const ChatBackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    final String backgroundImageAsset =
        CupertinoTheme.of(context).brightness == Brightness.dark
            ? AppImages.darkChatWallpaper
            : AppImages.lightChatWallpaper;

    return Image.asset(
      backgroundImageAsset,
      height: MediaQuery.of(context).size.height - kToolbarHeight,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
    );
  }
}
