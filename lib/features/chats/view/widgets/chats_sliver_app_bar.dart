import 'package:chat_app/core/widgets/sliver_search_app_bar/search_app_bar_action_item.dart';
import 'package:chat_app/core/widgets/sliver_search_app_bar/sliver_search_app_bar.dart';
import 'package:flutter/cupertino.dart';

class ChatsSliverAppBar extends StatelessWidget {
  const ChatsSliverAppBar({
    super.key,
    required this.focusNode,
  });

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return SliverSearchAppBar(
      title: 'Chats',
      onChanged: (_) {},
      onSubmit: (_) {},
      text: '',
      focusNode: focusNode,
      leading: SearchAppBarActionItem(
        child: const Text('Edit'),
        onPressed: () {},
      ),
      trailing: SearchAppBarActionItem(
        child: const Icon(CupertinoIcons.chat_bubble_text),
        onPressed: () {},
      ),
    );
  }
}
