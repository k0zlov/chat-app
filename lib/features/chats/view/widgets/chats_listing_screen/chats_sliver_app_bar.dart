import 'package:chat_app/core/widgets/sliver_search_app_bar/search_app_bar_action_item.dart';
import 'package:chat_app/core/widgets/sliver_search_app_bar/sliver_search_app_bar.dart';
import 'package:chat_app/di_container.dart';
import 'package:chat_app/features/chats/view/cubit/chats_cubit.dart';
import 'package:chat_app/features/chats/view/screens/create_chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatsSliverAppBar extends StatelessWidget {
  const ChatsSliverAppBar({
    super.key,
    required this.focusNode,
  });

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    final ChatsCubit cubit = context.read<ChatsCubit>();
    final ChatsState state = context.select((ChatsCubit cubit) => cubit.state);

    return SliverSearchAppBar(
      title: 'Chats',
      onChanged: cubit.onSearchText,
      text: state.searchText,
      onSubmit: (String value) {},
      onLoading: cubit.fetchChats,
      showLoadingWidget: true,
      loading: state.loadingChats,
      focusNode: focusNode,
      trailing: SearchAppBarActionItem(
        child: const Icon(CupertinoIcons.chat_bubble_text),
        onPressed: () {
          showCupertinoModalPopup<bool>(
            context: context,
            builder: (context) {
              return BlocProvider.value(
                value: getIt<ChatsCubit>(),
                child: const CreateChatScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
