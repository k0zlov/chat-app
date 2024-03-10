import 'package:chat_app/core/widgets/reactive_text_field.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.text,
    required this.onChanged,
    this.error,
    required this.label,
    this.obscureText,
    this.suffixIcon,
  });

  final String text;
  final Widget label;
  final void Function(String) onChanged;
  final String? error;
  final bool? obscureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      obscureText: obscureText,
      text: text,
      onChanged: onChanged,
      inputDecoration: InputDecoration(
        label: label,
        errorText: error,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
