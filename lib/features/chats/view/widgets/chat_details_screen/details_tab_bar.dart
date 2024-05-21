import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:dynamic_tabbar/dynamic_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsTab {
  const DetailsTab({
    required this.title,
    required this.body,
  });

  final String title;
  final Widget body;
}

class ChatDetailsTabBar extends StatelessWidget {
  const ChatDetailsTabBar({
    super.key,
    required this.chat,
  });

  final ChatEntity chat;

  @override
  Widget build(BuildContext context) {
    final CupertinoThemeData cupertinoTheme = CupertinoTheme.of(context);

    final Color backgroundColor =
        CupertinoTheme.of(context).brightness == Brightness.dark
            ? CupertinoColors.darkBackgroundGray
            : CupertinoColors.white;

    const List<DetailsTab> tabs = [
      DetailsTab(title: 'Media', body: _DefaultTabBody()),
      DetailsTab(title: 'Voice', body: _DefaultTabBody()),
      DetailsTab(title: 'Links', body: _DefaultTabBody()),
      DetailsTab(title: 'GIFs', body: _DefaultTabBody()),
    ];

    return Material(
      color: backgroundColor,
      child: DynamicTabBarWidget(
        onTabControllerUpdated: (controller) {},
        onTabChanged: (_) {},
        automaticIndicatorColorAdjustment: false,
        indicatorColor: cupertinoTheme.primaryColor,
        labelColor: cupertinoTheme.primaryColor,
        showBackIcon: false,
        showNextIcon: false,
        dividerHeight: 0,
        unselectedLabelColor: CupertinoColors.systemGrey,
        splashFactory: NoSplash.splashFactory,
        labelStyle: cupertinoTheme.textTheme.textStyle.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        indicatorWeight: 4,
        indicatorPadding: const EdgeInsets.only(bottom: 2),
        dynamicTabs: [
          for (int i = 0; i < tabs.length; i++) ...{
            TabData(
              index: i,
              title: Tab(child: Text(tabs[i].title)),
              content: tabs[i].body,
            ),
          },
        ],
      ),
    );
  }
}

class _DefaultTabBody extends StatelessWidget {
  const _DefaultTabBody();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: CupertinoTheme.of(context).scaffoldBackgroundColor,
      child: const Center(
        child: Text('Body'),
      ),
    );
  }
}
