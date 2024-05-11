import 'package:chat_app/core/widgets/buttons/cupertino_reload_button.dart';
import 'package:chat_app/features/chats/view/cubit/chats_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatReloadButton extends StatelessWidget {
  const ChatReloadButton({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatsCubit cubit = context.read<ChatsCubit>();
    final ChatsState state = context.select((ChatsCubit cubit) => cubit.state);

    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, right: 20),
        child: CupertinoReloadButton(
          showBackgroundColor: true,
          onLoading: cubit.fetchChats,
          loading: state.loadingChats,
        ),
      ),
    );
  }
}
