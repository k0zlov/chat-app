import 'package:chat_app/core/widgets/screens/screen_with_search_bar.dart';
import 'package:chat_app/features/chats/view/widgets/chats_listing_screen/chats_list.dart';
import 'package:chat_app/features/chats/view/widgets/chats_listing_screen/chats_search_widget.dart';
import 'package:chat_app/features/chats/view/widgets/chats_listing_screen/chats_sliver_app_bar.dart';
import 'package:flutter/cupertino.dart';

class ChatsListingScreen extends StatefulWidget {
  const ChatsListingScreen({super.key});

  @override
  State<ChatsListingScreen> createState() => _ChatsListingScreenState();
}

class _ChatsListingScreenState extends State<ChatsListingScreen> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWithSearchAppBar(
      searchAppBar: ChatsSliverAppBar(focusNode: _focusNode),
      sliverBody: const ChatsList(),
      focusNode: _focusNode,
      searchWidget: const ChatsSearchWidget(),
      showSearchWidget: false,
    );
  }
}
