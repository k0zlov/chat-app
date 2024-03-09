import 'package:flutter/material.dart';

class ReactiveTextField extends StatefulWidget {
  const ReactiveTextField({
    super.key,
    required String this.text,
    required void Function(String) this.onChanged,
    this.error,
    this.label,
  });

  final String text;
  final void Function(String) onChanged;
  final String? error;

  final Widget? label;

  @override
  State<ReactiveTextField> createState() => _ReactiveTextFieldState();
}

class _ReactiveTextFieldState extends State<ReactiveTextField> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.text;
  }

  @override
  void didUpdateWidget(covariant ReactiveTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.text != _controller.text) {
      _controller.text = widget.text;
      _focusNode.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: widget.onChanged,
      focusNode: _focusNode,
      decoration: InputDecoration(
        label: widget.label,
        errorText: widget.error,
      ),
    );
  }
}
