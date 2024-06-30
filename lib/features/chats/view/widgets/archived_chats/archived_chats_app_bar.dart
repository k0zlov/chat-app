import 'package:chat_app/core/widgets/buttons/app_bar_back_button.dart';
import 'package:chat_app/core/widgets/sliver_search_app_bar/sliver_search_app_bar.dart';
import 'package:chat_app/features/chats/view/cubit/chats_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ArchivedChatsSliverAppBar extends StatelessWidget {
  const ArchivedChatsSliverAppBar({
    super.key,
    required this.focusNode,
  });

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    final ChatsCubit cubit = context.read<ChatsCubit>();
    final ChatsState state = context.select((ChatsCubit cubit) => cubit.state);

    return SliverSearchAppBar(
      title: 'Archived Chats',
      onChanged: cubit.onArchivedChatsSearch,
      text: state.searchArchivedText,
      onSubmit: (String value) {},
      onLoading: cubit.fetchChats,
      showLoadingWidget: true,
      loading: state.loadingChats,
      focusNode: focusNode,
      leading: AppBarBackButton(
        minimize: true,
        onPressed: context.pop,
        blurred: false,
      ),
    );
  }
}
