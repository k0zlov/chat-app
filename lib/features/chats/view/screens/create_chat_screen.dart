import 'package:chat_app/core/widgets/screens/add_screen.dart';
import 'package:chat_app/features/chats/view/cubit/chats_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateChatScreen extends StatefulWidget {
  const CreateChatScreen({super.key});

  @override
  State<CreateChatScreen> createState() => _CreateChatScreenState();
}

class _CreateChatScreenState extends State<CreateChatScreen> {
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final ChatsCubit cubit = context.read<ChatsCubit>();
    final ChatsState state = context.select((ChatsCubit cubit) => cubit.state);

    return AddScreen(
      focusNode: _focusNode,
      title: 'Create chat',
      inputName: 'Title',
      text: state.createChatText,
      isValid: state.createChatText.length > 2,
      onChanged: cubit.onCreateChatText,
      onSubmit: cubit.createChat,
    );
  }
}
