import 'package:chat_app/core/widgets/reactive_text_field.dart';
import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({
    super.key,
    required this.chat,
  });

  final ChatEntity chat;

  @override
  Widget build(BuildContext context) {
    final ChatsCubit cubit = context.read<ChatsCubit>();

    final Color backgroundColor =
        CupertinoTheme.of(context).brightness == Brightness.dark
            ? CupertinoColors.black
            : CupertinoColors.lightBackgroundGray;

    final textStyle = CupertinoTheme.of(context).textTheme.textStyle;

    return ReactiveTextField(
      text: chat.text,
      builder: (controller, focusNode) {
        return CupertinoTextField(
          onChanged: (text) => cubit.onChatText(chatId: chat.id, text: text),
          controller: controller,
          focusNode: focusNode,
          placeholder: 'Message',
          onTapOutside: (_) => focusNode.unfocus(),
          placeholderStyle: textStyle.copyWith(
            color: CupertinoColors.systemGrey,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(15),
          ),
          suffix: CupertinoButton(
            padding: EdgeInsets.zero,
            child: const Icon(
              CupertinoIcons.tag_circle,
              color: CupertinoColors.systemGrey,
              size: 28,
            ),
            onPressed: () {},
          ),
        );
      },
    );
  }
}
