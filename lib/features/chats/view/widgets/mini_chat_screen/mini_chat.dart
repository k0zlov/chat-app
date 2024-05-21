import 'package:chat_app/features/chats/domain/entities/message_entity/message_entity.dart';
import 'package:chat_app/features/chats/view/widgets/chat_screen/chat_messages.dart';
import 'package:chat_app/features/chats/view/widgets/mini_chat_screen/mini_chat_header.dart';
import 'package:flutter/cupertino.dart';

class MiniChat extends StatefulWidget {
  const MiniChat({
    super.key,
    required this.visible,
    required this.title,
    required this.chatImage,
    required this.messages,
    this.animationAlignment,
    this.duration = const Duration(milliseconds: 220),
  });

  final bool visible;

  final Alignment? animationAlignment;

  final String title;

  final Widget chatImage;

  final List<MessageEntity> messages;

  final Duration duration;

  @override
  State<MiniChat> createState() => _MiniChatState();
}

class _MiniChatState extends State<MiniChat>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
        reverseCurve: Curves.easeIn,
      ),
    );

    if (widget.visible) {
      _animationController.forward();
    }
  }

  @override
  void didUpdateWidget(covariant MiniChat oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.visible == oldWidget.visible) return;

    if (widget.visible) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width * .95;

    return ScaleTransition(
      scale: _scaleAnimation,
      alignment: widget.animationAlignment ?? Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Column(
              children: [
                MiniChatScreenHeader(
                  image: widget.chatImage,
                  title: widget.title,
                ),
                ChatMessages(
                  height: 350,
                  width: width,
                  messages: widget.messages,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
