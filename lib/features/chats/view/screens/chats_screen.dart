import 'package:chat_app/core/widgets/sliver_search_app_bar/search_field.dart';
import 'package:flutter/cupertino.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FocusNode focusNode = FocusNode();

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Chats'),
      ),
      child: Column(
        children: [
          const SizedBox(height: 30),
          ChatAppSearchField(
            key: UniqueKey(),
            controller: TextEditingController(),
            focusNode: focusNode,
            onChanged: (_) {},
            onSubmitted:  (_) {},
          ),
        ],
      ),
    );
  }
}
