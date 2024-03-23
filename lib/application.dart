import 'package:chat_app/core/navigation/navigation.dart';
import 'package:flutter/cupertino.dart';

class ChatApplication extends StatelessWidget {
  const ChatApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp.router(
      title: 'Chat-App',
      debugShowCheckedModeBanner: false,
      theme: const CupertinoThemeData(
        primaryColor: CupertinoColors.activeBlue,
      ),
      routerConfig: AppNavigation.router,
    );
  }
}
