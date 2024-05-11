import 'package:chat_app/core/widgets/reactive_text_field.dart';
import 'package:flutter/cupertino.dart';

class SettingsTextOption extends StatelessWidget {
  const SettingsTextOption({
    super.key,
    required this.placeholder,
    required this.text,
    required this.onChanged,
  });

  final String text;
  final String placeholder;

  final void Function(String text) onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = CupertinoTheme.of(context);

    final textStyle = theme.textTheme.textStyle.copyWith(
      fontSize: 14,
      color: CupertinoColors.systemGrey.withOpacity(0.35),
    );

    return ReactiveTextField(
      text: text,
      builder: (controller, focusNode) {
        return CupertinoTextField(
          controller: controller,
          focusNode: focusNode,
          placeholder: placeholder,
          onChanged: onChanged,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
          placeholderStyle: textStyle,
          decoration: const BoxDecoration(
            color: null,
          ),
        );
      },
    );
  }
}
