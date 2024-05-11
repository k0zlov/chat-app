import 'package:chat_app/core/widgets/screens/bottom_nav_bar.dart';
import 'package:chat_app/features/settings/view/widgets/settings_screen/setting_options.dart';
import 'package:chat_app/features/settings/view/widgets/settings_screen/settings_app_bar.dart';
import 'package:chat_app/features/settings/view/widgets/settings_screen/settings_search_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();

  bool _showSearchWidget = false;

  @override
  void dispose() {
    _scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(_onFocus);
  }

  void _onFocus() {
    if (!_focusNode.hasFocus) return;

    _showSearchWidget = true;
    setState(() {});
    NavBarVisibilityProvider.of(context)?.setVisibility(value: false);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      child: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SettingsAppBar(
            focusNode: _focusNode,
            scrollController: _scrollController,
            onSearchCancel: () {
              Future.delayed(
                const Duration(milliseconds: 300),
                () {
                  _showSearchWidget = false;
                  setState(() {});
                  NavBarVisibilityProvider.of(context)
                      ?.setVisibility(value: true);
                },
              );
            },
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 700),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return SliverFadeTransition(opacity: animation, sliver: child);
            },
            layoutBuilder: (child, widgets) {
              return child ?? const SliverToBoxAdapter();
            },
            child: _showSearchWidget
                ? const SettingsSearchWidget()
                : const SettingsOptions(),
          ),
        ],
      ),
    );
  }
}
