import 'package:flutter/cupertino.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Chats'),
      ),
      child: Column(
        children: [],
      ),
    );
  }
}
