import 'package:chat_app/features/settings/view/widgets/settings_edit_screen/edit_cancel_button.dart';
import 'package:chat_app/features/settings/view/widgets/settings_edit_screen/edit_done_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsEditAppBar extends StatefulWidget {
  const SettingsEditAppBar({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  State<SettingsEditAppBar> createState() => _SettingsEditAppBarState();
}

class _SettingsEditAppBarState extends State<SettingsEditAppBar> {
  bool _scrollAbove = false;

  void _setScrollAbove(bool value) {
    if (_scrollAbove == value) return;

    _scrollAbove = value;
    setState(() {});
  }

  void _scrollListener() {
    final double offset = widget.scrollController.offset;

    if (offset > 1) {
      _setScrollAbove(true);
    } else {
      _setScrollAbove(false);
    }
  }

  @override
  void initState() {
    super.initState();

    widget.scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = CupertinoTheme.of(context);

    return SliverAppBar(
      pinned: true,
      leadingWidth: 70,
      leading: const SettingsEditCancelButton(),
      backgroundColor: _scrollAbove
          ? theme.barBackgroundColor
          : theme.scaffoldBackgroundColor,
      actions: const [
        SettingsEditDoneButton(),
      ],
    );
  }
}
