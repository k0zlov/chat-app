import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class NavBarVisibilityProvider extends InheritedWidget {
  const NavBarVisibilityProvider({
    super.key,
    required this.isVisible,
    required this.setVisibility,
    required super.child,
  });

  final bool isVisible;
  final void Function({required bool value}) setVisibility;

  static NavBarVisibilityProvider? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<NavBarVisibilityProvider>();
  }

  @override
  bool updateShouldNotify(NavBarVisibilityProvider oldWidget) {
    return isVisible != oldWidget.isVisible;
  }
}

class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  bool _visible = true;

  void _onTap(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  void _setVisibility({required bool value}) {
    if (value == _visible) return;
    _visible = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor =
        CupertinoTheme.of(context).barBackgroundColor.withOpacity(0.9);

    return NavBarVisibilityProvider(
      isVisible: _visible,
      setVisibility: _setVisibility,
      child: CupertinoPageScaffold(
        resizeToAvoidBottomInset: false,
        child: Stack(
          children: [
            widget.navigationShell,
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              bottom: _visible ? 0 : -100,
              child: SizedBox(
                height: 80,
                width: MediaQuery.of(context).size.width,
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
                      currentIndex: widget.navigationShell.currentIndex,
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
            ),
          ],
        ),
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
