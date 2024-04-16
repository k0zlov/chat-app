import 'dart:async';
import 'dart:ui';

import 'package:chat_app/core/widgets/blur/blurred_widget.dart';
import 'package:chat_app/features/settings/view/widgets/settings_edit_button.dart';
import 'package:chat_app/features/settings/view/widgets/settings_qr_button.dart';
import 'package:chat_app/features/settings/view/widgets/settings_search_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

enum SettingsAppBarMode {
  expanded,
  basic,
  collapsed,
}

class SettingsAppBar extends StatefulWidget {
  const SettingsAppBar({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  State<SettingsAppBar> createState() => _SettingsAppBarState();
}

class _SettingsAppBarState extends State<SettingsAppBar> {
  bool _cooldown = false;
  SettingsAppBarMode _mode = SettingsAppBarMode.basic;

  bool get expanded => _mode == SettingsAppBarMode.expanded;

  bool get collapsed => _mode == SettingsAppBarMode.collapsed;

  final double toolbarHeight = 70;
  final double expandedHeight = 400;
  final double basicHeight = 210;

  void _changeMode(SettingsAppBarMode newMode) {
    if (_mode == newMode || _cooldown) return;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _mode = newMode;
      _cooldown = true;
      setState(() {});

      Future.delayed(const Duration(milliseconds: 200), () {
        _cooldown = false;
        setState(() {});
      });
    });
  }

  @override
  void initState() {
    super.initState();

    widget.scrollController.addListener(_scrollListener);
    widget.scrollController.position.isScrollingNotifier.addListener(
      _autoScroll,
    );
  }

  void _scrollListener() {
    final ScrollController scrollController = widget.scrollController;

    if (!scrollController.hasClients) return;

    if (_cooldown) return;

    if (_onScrollDownStretched(scrollController)) return;

    if (_onCollapsed(scrollController)) return;

    if (_onBasic(scrollController)) return;
  }

  bool _onScrollDownStretched(ScrollController controller) {
    if (_mode != SettingsAppBarMode.expanded) return false;

    final ScrollDirection scrollDirection =
        controller.position.userScrollDirection;

    final bool scrollingDownwards = scrollDirection != ScrollDirection.forward;

    if (scrollingDownwards && expanded) {
      _changeMode(SettingsAppBarMode.basic);
      return true;
    }
    return false;
  }

  bool _onCollapsed(ScrollController controller) {
    if (_mode == SettingsAppBarMode.collapsed) return false;

    if (controller.offset > basicHeight - 50) {
      _changeMode(SettingsAppBarMode.collapsed);
      return true;
    }
    return false;
  }

  bool _onBasic(ScrollController controller) {
    if (_mode == SettingsAppBarMode.basic ||
        _mode == SettingsAppBarMode.expanded) return false;

    if (controller.offset < basicHeight - 50) {
      _changeMode(SettingsAppBarMode.basic);
      return true;
    }
    return false;
  }

  void _autoScroll() {
    final ScrollController scrollController = widget.scrollController;

    if (!scrollController.hasClients) return;

    Future.delayed(const Duration(milliseconds: 50), () async {
      if (!scrollController.position.isScrollingNotifier.value) {
        final currentOffset = scrollController.offset;

        if (currentOffset < basicHeight / 1.7) {
          await scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        } else if (currentOffset > basicHeight / 1.7 &&
            currentOffset < basicHeight) {
          await scrollController.animateTo(
            basicHeight,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color borderColor =
        CupertinoTheme.of(context).brightness == Brightness.dark
            ? CupertinoColors.systemGrey
            : CupertinoColors.inactiveGray;

    final Color backgroundColor = CupertinoTheme.of(context).barBackgroundColor;

    return SliverAppBar(
      pinned: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      actions: [
        Visibility(
          visible: _mode != SettingsAppBarMode.collapsed,
          child: SettingsEditButton(blur: expanded),
        ),
        Visibility(
          visible: _mode == SettingsAppBarMode.collapsed,
          child: const SettingsSearchButton(),
        ),
      ],
      toolbarHeight: toolbarHeight,
      leadingWidth: 70,
      leading: Visibility(
        visible: !collapsed,
        child: QrCodeButton(blur: expanded),
      ),
      stretch: true,
      expandedHeight: expanded ? expandedHeight : basicHeight,
      stretchTriggerOffset: 30,
      onStretchTrigger: () async {
        if(expanded) return;
        _changeMode(SettingsAppBarMode.expanded);
        await HapticFeedback.lightImpact();
      },
      bottom: !collapsed
          ? null
          : PreferredSize(
              preferredSize: const Size.fromHeight(0.2),
              child: Container(
                height: 0.2,
                width: double.infinity,
                color: borderColor,
              ),
            ),
      backgroundColor: collapsed ? backgroundColor : Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.zero,
        collapseMode: CollapseMode.pin,
        background: _SettingsAppBarBackground(
          onImagePressed: () {
            if (_mode == SettingsAppBarMode.expanded) return;
            _mode = SettingsAppBarMode.expanded;
            setState(() {});
          },
          expanded: expanded,
        ),
        expandedTitleScale: 1.4,
        centerTitle: true,
        title: _UserInfoContainer(
          collapsed: collapsed,
          expanded: expanded,
        ),
      ),
    );
  }
}

class _SettingsAppBarBackground extends StatelessWidget {
  const _SettingsAppBarBackground({
    required this.expanded,
    required this.onImagePressed,
  });

  final bool expanded;
  final void Function() onImagePressed;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Align(
      child: GestureDetector(
        onTap: onImagePressed,
        child: AnimatedContainer(
          curve: Curves.fastEaseInToSlowEaseOut,
          clipBehavior: Clip.hardEdge,
          duration: const Duration(milliseconds: 240),
          height: expanded ? screenSize.height : 110,
          width: expanded ? screenSize.width : 110,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(expanded ? 0 : 100),
          ),
          child: Image.network(
            'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class _UserInfoContainer extends StatelessWidget {
  const _UserInfoContainer({
    required this.collapsed,
    required this.expanded,
  });

  final bool expanded;
  final bool collapsed;

  @override
  Widget build(BuildContext context) {
    final TextStyle themeTextStyle =
        CupertinoTheme.of(context).textTheme.textStyle;

    return BlurredWidget(
      blurred: expanded,
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: EdgeInsets.only(
            left: expanded ? 8 : 0,
          ),
          alignment: expanded ? Alignment.centerLeft : Alignment.center,
          child: Column(
            crossAxisAlignment:
                expanded ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Username Username',
                textAlign: TextAlign.center,
                style: themeTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: expanded ? CupertinoColors.white : null,
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 100),
                opacity: collapsed ? 0 : 1,
                child: Text(
                  '+380 95 439 34 83 * @onemorro',
                  style: themeTextStyle.copyWith(
                    fontSize: 12,
                    color: expanded
                        ? CupertinoColors.white
                        : CupertinoColors.inactiveGray,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
