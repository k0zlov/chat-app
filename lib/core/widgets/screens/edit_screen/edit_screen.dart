import 'package:chat_app/core/widgets/screens/edit_screen/edit_app_bar.dart';
import 'package:flutter/cupertino.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({
    super.key,
    required this.onDone,
    required this.sliverBody,
    required this.onCancel,
  });

  final void Function()? onDone;
  final void Function()? onCancel;
  final Widget sliverBody;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          EditScreenAppBar(
            onCancel: widget.onCancel,
            onDone: widget.onDone,
            scrollController: _scrollController,
          ),
          widget.sliverBody,
        ],
      ),
    );
  }
}
