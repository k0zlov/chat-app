import 'package:chat_app/core/widgets/context_menu/context_menu.dart';
import 'package:flutter/cupertino.dart';

class MessageContextMenu extends StatelessWidget {
  const MessageContextMenu({
    super.key,
    required this.visible,
    required this.duration,
  });

  final bool visible;

  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return ContextMenu(
      duration: duration,
      actions: [],
    );
  }
}
