import 'package:chat_app/core/navigation/navigation.dart';
import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChatSliverAppBar extends StatefulWidget {
  const ChatSliverAppBar({
    super.key,
    required this.chat,
    required this.detailsMode,
    required this.setDetailsMode,
    required this.scrollController,
  });

  final ChatEntity chat;
  final bool detailsMode;
  final void Function(bool newValue) setDetailsMode;
  final ScrollController scrollController;

  @override
  State<ChatSliverAppBar> createState() => _ChatSliverAppBarState();
}

class _ChatSliverAppBarState extends State<ChatSliverAppBar> {

  void _onBack() {
    context.go(AppRoutes.chats.path);
  }

  @override
  Widget build(BuildContext context) {
    final Color borderColor =
        CupertinoTheme.of(context).brightness == Brightness.dark
            ? CupertinoColors.systemGrey
            : CupertinoColors.inactiveGray;

    return SliverAppBar(
      backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
      pinned: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.1),
        child: Container(
          height: 0.1,
          width: double.infinity,
          color: CupertinoTheme.of(context).barBackgroundColor,
          child: Divider(
            thickness: 0.1,
            color: borderColor,
          ),
        ),
      ),
      toolbarHeight: 70,
      leadingWidth: 80,
      leading: CupertinoNavigationBarBackButton(
        previousPageTitle: 'Back',
        onPressed: _onBack,
      ),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        titlePadding: EdgeInsets.zero,
        centerTitle: true,
        background: const _BackgroundWidget(),
        expandedTitleScale: 1.2,
        title: _TitleWidget(
          title: 'Chat ID: ${widget.chat.id}',
        ),
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final textStyle = CupertinoTheme.of(context).textTheme.textStyle.copyWith(
          fontSize: 13,
        );

    return AnimatedContainer(
      duration: const Duration(milliseconds: 240),
      alignment: Alignment.bottomCenter,
      height: 50,
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 14),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              style: textStyle,
            ),
            Text(
              'last seen recently',
              style: textStyle.copyWith(
                fontSize: 12,
                color: CupertinoColors.inactiveGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BackgroundWidget extends StatelessWidget {
  const _BackgroundWidget();


  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      duration: const Duration(milliseconds: 240),
      alignment: Alignment.bottomRight,
      child: AnimatedContainer(
        curve: Curves.fastEaseInToSlowEaseOut,
        clipBehavior: Clip.hardEdge,
        height: 45,
        width: 45,
        margin: const EdgeInsets.only(bottom: 4, right: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
        ),
        duration: const Duration(milliseconds: 240),
        child: Image.network(
          'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
