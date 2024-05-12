import 'package:chat_app/features/chats/domain/entities/message_entity/message_entity.dart';
import 'package:chat_app/features/chats/view/widgets/chat_screen/chat_messages.dart';
import 'package:flutter/cupertino.dart';

class MiniChatScreen extends StatefulWidget {
  const MiniChatScreen({
    super.key,
    required this.title,
    required this.messages,
    required this.alignment,
    required this.chatImage,
  });

  final String title;
  final Widget chatImage;
  final List<MessageEntity> messages;

  final Alignment alignment;

  @override
  State<MiniChatScreen> createState() => _MiniChatScreenState();
}

class _MiniChatScreenState extends State<MiniChatScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 240),
      reverseDuration: const Duration(milliseconds: 220),
    );
    _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
        reverseCurve: Curves.easeIn,
      ),
    );
    _controller.forward();
  }

  Future<void> _closeDialog() async {
    await _controller.reverse();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = CupertinoTheme.of(context);

    final double width = MediaQuery.of(context).size.width * .95;

    return PopScope(
      onPopInvoked: (_) async {
        await _closeDialog();
      },
      child: CupertinoPopupSurface(
        isSurfacePainted: false,
        child: ScaleTransition(
          scale: _scaleAnimation,
          alignment: widget.alignment,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: width,
                      color: theme.barBackgroundColor.withOpacity(0.74),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(widget.title),
                                Text(
                                  'last seen recently',
                                  style: theme.textTheme.textStyle.copyWith(
                                    fontSize: 12,
                                    color: CupertinoColors.systemGrey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: widget.chatImage,
                              ),
                            ),
                          ),
                        ],
                      ),
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
        ),
      ),
    );
  }
}
