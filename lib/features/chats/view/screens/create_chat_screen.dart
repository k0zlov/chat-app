import 'package:chat_app/core/widgets/screens/add_screen.dart';
import 'package:chat_app/features/chats/view/cubit/chats_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateChatScreen extends StatelessWidget {
  const CreateChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatsCubit cubit = context.read<ChatsCubit>();
    final ChatsState state = context.select((ChatsCubit cubit) => cubit.state);

    return AddScreen(
      title: 'Create chat',
      inputName: 'Title',
      text: state.createChatText,
      isValid: state.createChatText.length > 2,
      onChanged: cubit.onCreateChatText,
      onSubmit: cubit.createChat,
    );
  }
}
