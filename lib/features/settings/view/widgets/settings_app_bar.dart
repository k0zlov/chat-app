import 'dart:async';

import 'package:chat_app/core/widgets/blur/blurred_widget.dart';
import 'package:chat_app/core/widgets/buttons/edit_button.dart';
import 'package:chat_app/core/widgets/buttons/qr_button.dart';
import 'package:chat_app/core/widgets/search/search_field.dart';
import 'package:chat_app/features/settings/view/widgets/settings_search_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

enum AppBarMode {
  basic,
  expanded,
  collapsed;

  const AppBarMode();

  bool get isExpanded => this == expanded;

  bool get isCollapsed => this == collapsed;

  bool get isBasic => this == basic;
}

class SettingsAppBar extends StatefulWidget {
  const SettingsAppBar({
    super.key,
    required this.scrollController,
    required this.focusNode,
    required this.onSearchCancel,
  });

  final ScrollController scrollController;
  final FocusNode focusNode;
  final void Function() onSearchCancel;

  @override
  State<SettingsAppBar> createState() => _SettingsAppBarState();
}

class _SettingsAppBarState extends State<SettingsAppBar> {
  bool _cooldown = false;
  bool _searchMode = false;
  AppBarMode _mode = AppBarMode.basic;

  final double toolbarHeight = 70;
  final double expandedHeight = 400;
  final double basicHeight = 210;

  final TextEditingController _controller = TextEditingController();

  void _changeMode(AppBarMode newMode) async {
    if (_mode == newMode || _cooldown) return;

    if (_searchMode) return;

    await HapticFeedback.lightImpact();
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

  void _activateSearchMode() {
    if (_searchMode) return;

    _searchMode = true;
    setState(() {});
    Future.delayed(
      const Duration(milliseconds: 20),
      () => widget.focusNode.focusInDirection(TraversalDirection.up),
    );
  }

  void _deactivateSearchMode() {
    if (!_searchMode) return;

    Future.delayed(
      const Duration(milliseconds: 300),
      () {
        _searchMode = false;
        _mode = AppBarMode.collapsed;
        setState(() {});
        widget.scrollController.jumpTo(basicHeight);
      },
    );
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
    if (_mode != AppBarMode.expanded) return false;

    final ScrollDirection scrollDirection =
        controller.position.userScrollDirection;

    final bool scrollingDownwards = scrollDirection != ScrollDirection.forward;

    if (scrollingDownwards && _mode.isExpanded) {
      _changeMode(AppBarMode.basic);
      return true;
    }

    return false;
  }

  bool _onCollapsed(ScrollController controller) {
    if (_mode == AppBarMode.collapsed) return false;

    if (controller.offset > basicHeight - 100) {
      _changeMode(AppBarMode.collapsed);
      return true;
    }
    return false;
  }

  bool _onBasic(ScrollController controller) {
    if (_mode == AppBarMode.basic || _mode == AppBarMode.expanded) return false;

    if (controller.offset < basicHeight - 100) {
      _changeMode(AppBarMode.basic);
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

        if (currentOffset < basicHeight - 100) {
          await scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        } else if (currentOffset > basicHeight - 100 &&
            currentOffset < basicHeight - 50) {
          await scrollController.animateTo(
            basicHeight - 50,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    widget.focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = CupertinoTheme.of(context).barBackgroundColor;

    return SliverAppBar(
      pinned: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      clipBehavior: Clip.hardEdge,
      actions: [
        switch ((_mode, _searchMode)) {
          (AppBarMode.basic, false) => EditButton(blur: _mode.isExpanded),
          (AppBarMode.expanded, false) => EditButton(blur: _mode.isExpanded),
          (AppBarMode.collapsed, false) =>
            SettingsSearchButton(onPressed: _activateSearchMode),
          _ => const SizedBox(),
        },
      ],
      toolbarHeight: toolbarHeight,
      leadingWidth: 70,
      leading: Visibility(
        visible: !_mode.isCollapsed,
        child: QrCodeButton(blur: _mode.isExpanded),
      ),
      stretch: true,
      expandedHeight: _searchMode
          ? 40
          : _mode.isExpanded
              ? expandedHeight
              : basicHeight,
      stretchTriggerOffset: 10,
      onStretchTrigger: () async => _changeMode(AppBarMode.expanded),
      backgroundColor: backgroundColor,
      bottom: _searchMode
          ? PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: ChatAppSearchField(
                  height: 40,
                  text: '',
                  reverseAnimation: false,
                  controller: _controller,
                  focusNode: widget.focusNode,
                  onChanged: (_) {},
                  onSubmitted: (_) {},
                  onCancel: () {
                    widget.onSearchCancel.call();
                    _deactivateSearchMode();
                  },
                ),
              ),
            )
          : null,
      flexibleSpace: ColoredBox(
        color: _mode.isCollapsed
            ? backgroundColor
            : CupertinoTheme.of(context).scaffoldBackgroundColor,
        child: Visibility(
          visible: !_searchMode,
          child: FlexibleSpaceBar(
            titlePadding: EdgeInsets.zero,
            collapseMode: CollapseMode.pin,
            background: _SettingsAppBarBackground(
              onImagePressed: () {
                if (_mode.isExpanded) return;
                _mode = AppBarMode.expanded;
                setState(() {});
              },
              expanded: _mode.isExpanded,
            ),
            expandedTitleScale: 1.4,
            centerTitle: true,
            title: _UserInfoContainer(
              collapsed: _mode.isCollapsed,
              expanded: _mode.isExpanded,
            ),
          ),
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
