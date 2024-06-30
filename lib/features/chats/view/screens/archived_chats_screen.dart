import 'package:chat_app/core/widgets/screens/screen_with_search_bar.dart';
import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:chat_app/features/chats/view/widgets/archived_chats/archived_chats_app_bar.dart';
import 'package:chat_app/features/chats/view/widgets/chats_listing_screen/chats_list.dart';
import 'package:chat_app/features/chats/view/widgets/chats_listing_screen/chats_search_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArchivedChatsScreen extends StatefulWidget {
  const ArchivedChatsScreen({super.key});

  @override
  State<ArchivedChatsScreen> createState() => _ArchivedChatsScreenState();
}

class _ArchivedChatsScreenState extends State<ArchivedChatsScreen> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ChatsState state = context.select((ChatsCubit cubit) => cubit.state);

    final List<ChatEntity> archivedChats =
        state.chats.where((e) => e.isArchived).toList();

    final List<ChatEntity> filteredChats = archivedChats.where(
      (e) => e.title.contains(state.searchArchivedText),
    ).toList();

    return ScreenWithSearchAppBar(
      searchAppBar: ArchivedChatsSliverAppBar(
        focusNode: _focusNode,
      ),
      sliverBody: ChatsList(
        chats: filteredChats,
        showArchivedChats: false,
      ),
      searchingOpacity: 1,
      focusNode: _focusNode,
      searchWidget: const ChatsSearchWidget(),
      showSearchWidget: false,
    );
  }
}
