import 'package:chat_app/core/widgets/reactive_text_field.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.text,
    required this.onChanged,
    this.error,
    required this.label,
  });

  final String text;
  final Widget label;
  final void Function(String) onChanged;
  final String? error;

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      text: text,
      label: label,
      onChanged: onChanged,
      error: error,
    );
  }
}
