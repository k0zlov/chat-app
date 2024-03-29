import 'package:chat_app/core/widgets/reactive_text_field.dart';
import 'package:flutter/cupertino.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    required this.onChanged,
    required this.text,
    super.key,
    this.placeholder,
    this.prefix,
    this.obscureText = false,
    this.validator,
  });

  final String text;
  final String? placeholder;
  final Widget? prefix;
  final bool obscureText;
  final void Function(String value) onChanged;
  final String? Function(String? value)? validator;

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = CupertinoTheme.of(context).primaryColor;
    final Color backgroundColor = CupertinoTheme.of(context).barBackgroundColor;

    final Color inputColor = backgroundColor.withOpacity(0.99);

    const Radius borderRadius = Radius.circular(15);

    final BorderSide borderSide = BorderSide(
      color: primaryColor.withOpacity(0.3),
    );

    return ReactiveTextField(
      text: text,
      builder: (controller, focusNode) {
        final bool selected = focusNode.hasFocus;

        return CupertinoTextFormFieldRow(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          focusNode: focusNode,
          obscureText: obscureText,
          autocorrect: false,
          placeholder: placeholder,
          validator: validator,
          padding: const EdgeInsets.symmetric(vertical: 5),
          style: const TextStyle(fontSize: 18),
          onChanged: onChanged,
          prefix: Container(
            decoration: BoxDecoration(
              color: inputColor,
              border: selected
                  ? Border(
                      top: borderSide,
                      bottom: borderSide,
                      left: borderSide,
                    )
                  : null,
              borderRadius: const BorderRadius.only(
                bottomLeft: borderRadius,
                topLeft: borderRadius,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: prefix,
            ),
          ),
          decoration: BoxDecoration(
            color: inputColor,
            border: selected
                ? Border(
                    top: borderSide,
                    bottom: borderSide,
                    right: borderSide,
                  )
                : null,
            borderRadius: const BorderRadius.only(
              bottomRight: borderRadius,
              topRight: borderRadius,
            ),
          ),
        );
      },
    );
  }
}
