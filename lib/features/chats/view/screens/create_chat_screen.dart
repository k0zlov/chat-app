import 'package:chat_app/core/widgets/screens/add_screen.dart';
import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:chat_app/features/chats/view/widgets/chat_details_screen/chat_type_field.dart';
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
      body: ChatTypeField(
        type: state.createChatType,
        onPressed: cubit.onCreateChatType,
      ),
    );
  }
}
