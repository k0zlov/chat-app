import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:chat_app/features/chats/view/widgets/mini_archived_chats/mini_acrhived_chats_header.dart';
import 'package:chat_app/features/chats/view/widgets/mini_archived_chats/mini_archived_chats_list.dart';
import 'package:flutter/cupertino.dart';

class MiniArchivedChats extends StatefulWidget {
  const MiniArchivedChats({
    super.key,
    required this.visible,
    required this.chats,
    this.animationAlignment,
    this.duration = const Duration(milliseconds: 220),
  });

  final bool visible;

  final Alignment? animationAlignment;

  final List<ChatEntity> chats;

  final Duration duration;

  @override
  State<MiniArchivedChats> createState() => _MiniArchivedChatsState();
}

class _MiniArchivedChatsState extends State<MiniArchivedChats>
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
  void didUpdateWidget(covariant MiniArchivedChats oldWidget) {
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
    return ScaleTransition(
      scale: _scaleAnimation,
      alignment: widget.animationAlignment ?? Alignment.center,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const MiniAcrhivedChatsHeader(),
                  MiniArchivedChatsList(chats: widget.chats),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
