import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = CupertinoTheme.of(context).barBackgroundColor;

    return CupertinoPageScaffold(
      child: Stack(
        children: [
          navigationShell,
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: CupertinoTabBar(
                  height: 80,
                  backgroundColor: backgroundColor,
                  border: Border(
                    top: BorderSide(
                      width: 0.4,
                      color: CupertinoColors.systemGrey3.withOpacity(0.1),
                    ),
                  ),
                  currentIndex: navigationShell.currentIndex,
                  onTap: _onTap,
                  items: const [
                    BottomNavigationBarItem(
                      icon: _CustomNavigationBarItem(
                        iconData: CupertinoIcons.profile_circled,
                        title: 'Contacts',
                      ),
                    ),
                    BottomNavigationBarItem(
                      icon: _CustomNavigationBarItem(
                        iconData: CupertinoIcons.chat_bubble_2_fill,
                        title: 'Chats',
                      ),
                    ),
                    BottomNavigationBarItem(
                      icon: _CustomNavigationBarItem(
                        iconData: CupertinoIcons.settings,
                        title: 'Settings',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomNavigationBarItem extends StatelessWidget {
  const _CustomNavigationBarItem({
    required this.iconData,
    required this.title,
  });

  final IconData iconData;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Icon(iconData),
          const SizedBox(height: 2),
          Text(title),
        ],
      ),
    );
  }
}
