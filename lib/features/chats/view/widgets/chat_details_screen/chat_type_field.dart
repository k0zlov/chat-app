import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:chat_app/features/chats/view/widgets/chat_details_screen/chat_type_button.dart';
import 'package:flutter/cupertino.dart';

class ChatTypeField extends StatelessWidget {
  const ChatTypeField({
    super.key,
    required this.onPressed,
    required this.type,
  });

  final ChatType type;

  final void Function(ChatType type) onPressed;

  @override
  Widget build(BuildContext context) {
    final Color borderColor =
        CupertinoTheme.of(context).brightness == Brightness.dark
            ? CupertinoColors.systemGrey
            : CupertinoColors.inactiveGray;

    final BorderSide borderSide = BorderSide(color: borderColor, width: 0.3);

    final textStyle = CupertinoTheme.of(context).textTheme.textStyle.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: CupertinoTheme.of(context).primaryColor,
        );

    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(bottom: borderSide),
      ),
      child: Row(
        children: [
          Container(
            height: 40,
            decoration: BoxDecoration(
              border: Border(right: borderSide),
            ),
            padding: const EdgeInsets.only(right: 12),
            alignment: Alignment.center,
            child: Text('Chat Type', style: textStyle),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: ChatTypeButton(
              type: type,
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}
