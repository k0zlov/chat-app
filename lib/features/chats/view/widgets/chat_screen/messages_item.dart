import 'package:chat_app/core/widgets/context_menu/context_menu_action.dart';
import 'package:chat_app/core/widgets/context_menu/context_menu_area.dart';
import 'package:chat_app/features/chats/domain/entities/message_entity/message_entity.dart';
import 'package:chat_app/features/chats/view/widgets/chat_screen/message_status_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart' hide TextDirection;

class ChatMessagesItem extends StatelessWidget {
  const ChatMessagesItem({
    super.key,
    required this.message,
    required this.messageAuthor,
  });

  final MessageEntity message;
  final bool messageAuthor;

  @override
  Widget build(BuildContext context) {
    final theme = CupertinoTheme.of(context);

    final textStyle = theme.textTheme.textStyle;

    final bool darkTheme = theme.brightness == Brightness.dark;

    final Color backgroundColor = messageAuthor
        ? theme.primaryColor.withOpacity(0.8)
        : theme.barBackgroundColor;

    final Color timeTextColor = messageAuthor
        ? CupertinoColors.black.withOpacity(0.4)
        : CupertinoColors.inactiveGray;

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment:
            messageAuthor ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          ContextMenuArea(
            heroTag: 'msg${message.id}',
            actions: [
              ContextMenuAction(
                iconData: CupertinoIcons.square_on_square,
                title: 'Copy',
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: message.content));
                },
              ),
              ContextMenuAction(
                iconData: CupertinoIcons.arrowshape_turn_up_right,
                title: 'Save',
                onPressed: () {},
              ),
              ContextMenuAction(
                destructive: true,
                iconData: CupertinoIcons.delete,
                title: 'Delete',
                onPressed: () {},
              ),
            ],
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 110,
                maxWidth: MediaQuery.of(context).size.width / 1.3,
              ),
              child: IntrinsicWidth(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: darkTheme
                        ? backgroundColor
                        : backgroundColor.withAlpha(180),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(message.content, maxLines: 100),
                      ),
                      const SizedBox(width: 10),
                      Row(
                        children: [
                          Text(
                            DateFormat.Hm().format(message.createdAt),
                            style: textStyle.copyWith(
                              fontSize: 12,
                              color: timeTextColor,
                            ),
                          ),
                          const MessageStatusIndicator(
                            status: MessageStatus.seen,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
