import 'package:flutter/cupertino.dart';

typedef TextFieldBuilder = Widget Function(
  TextEditingController controller,
  FocusNode focusNode,
);

class ReactiveTextField extends StatefulWidget {
  const ReactiveTextField({
    super.key,
    required this.text,
    required this.builder,
  });

  final String text;
  final TextFieldBuilder builder;

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

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.text != _controller.text) {
        _controller.text = widget.text;
        _focusNode.unfocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(_controller, _focusNode);
  }
}
