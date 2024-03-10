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
    this.prefixIcon, this.helperText,
  });

  final String text;
  final Widget label;
  final void Function(String) onChanged;
  final String? error;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? helperText;

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      obscureText: obscureText,
      text: text,
      onChanged: onChanged,
      inputDecoration: InputDecoration(
        label: label,
        floatingLabelStyle: const TextStyle(fontSize: 18),
        helperText: helperText,
        errorText: error,
        suffixIcon: suffixIcon,
        filled: true,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
