import 'package:chat_app/core/navigation/navigation.dart';
import 'package:flutter/material.dart';

class ChatApplication extends StatelessWidget {
  const ChatApplication({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Chat-App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: AppNavigation.router,
    );
  }
}
