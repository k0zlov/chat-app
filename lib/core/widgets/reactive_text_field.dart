import 'package:flutter/material.dart';

class ReactiveTextField extends StatefulWidget {
  const ReactiveTextField({
    super.key,
    required String this.text,
    required void Function(String) this.onChanged,
    this.obscureText,
    this.inputDecoration,
  });

  final String text;
  final void Function(String) onChanged;

  final InputDecoration? inputDecoration;
  final bool? obscureText;

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
      obscureText: widget.obscureText ?? false,
      controller: _controller,
      onChanged: widget.onChanged,
      focusNode: _focusNode,
      decoration: widget.inputDecoration,
    );
  }
}
