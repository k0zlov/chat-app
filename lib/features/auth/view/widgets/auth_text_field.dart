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
    const Radius borderRadius = Radius.circular(15);

    return ReactiveTextField(
      text: text,
      builder: (controller, focusNode) {
        return CupertinoTextFormFieldRow(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          focusNode: focusNode,
          obscureText: obscureText,
          autocorrect: false,
          placeholder: placeholder,
          validator: validator,
          padding: EdgeInsetsDirectional.zero,
          style: const TextStyle(fontSize: 18),
          onChanged: onChanged,
          prefix: Container(
            decoration: const BoxDecoration(
              color: CupertinoColors.extraLightBackgroundGray,
              borderRadius: BorderRadius.only(
                bottomLeft: borderRadius,
                topLeft: borderRadius,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: prefix,
            ),
          ),
          decoration: const BoxDecoration(
            color: CupertinoColors.extraLightBackgroundGray,
            borderRadius: BorderRadius.only(
              bottomRight: borderRadius,
              topRight: borderRadius,
            ),
            border: Border.symmetric(
              horizontal: BorderSide(
                color: CupertinoColors.lightBackgroundGray,
              ),
            ),
          ),
        );
      },
    );
  }
}
