import 'package:chat_app/core/widgets/screens/screen_with_search_bar.dart';
import 'package:chat_app/features/chats/view/widgets/chats_list.dart';
import 'package:chat_app/features/chats/view/widgets/chats_search_widget.dart';
import 'package:chat_app/features/chats/view/widgets/chats_sliver_app_bar.dart';
import 'package:flutter/cupertino.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return ScreenWithSearchAppBar(
      searchAppBar: ChatsSliverAppBar(focusNode: focusNode),
      sliverBody: const ChatsList(),
      focusNode: focusNode,
      searchWidget: const ChatsSearchWidget(),
      showSearchWidget: false,
    );
  }
}
