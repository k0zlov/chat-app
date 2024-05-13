import 'package:chat_app/core/widgets/screens/edit_screen/edit_cancel_button.dart';
import 'package:chat_app/core/widgets/screens/edit_screen/edit_done_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditScreenAppBar extends StatefulWidget {
  const EditScreenAppBar({
    super.key,
    required this.scrollController,
    required this.onDone,
    required this.onCancel,
  });

  final void Function()? onDone;
  final void Function()? onCancel;
  final ScrollController scrollController;

  @override
  State<EditScreenAppBar> createState() => _EditScreenAppBarState();
}

class _EditScreenAppBarState extends State<EditScreenAppBar> {
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
      leading: EditScreenCancelButton(onPressed: widget.onCancel),
      backgroundColor: _scrollAbove
          ? theme.barBackgroundColor
          : theme.scaffoldBackgroundColor,
      actions: [
        EditScreenDoneButton(onPressed: widget.onDone),
      ],
    );
  }
}
