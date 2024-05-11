import 'package:chat_app/core/navigation/navigation.dart';
import 'package:chat_app/core/widgets/buttons/edit_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class SettingsEditButton extends StatelessWidget {
  const SettingsEditButton({
    required this.blur,
    super.key,
  });

  final bool blur;

  @override
  Widget build(BuildContext context) {
    return EditButton(
      blur: blur,
      onPressed: () => context.go(AppRoutes.editSettings.path),
    );
  }
}
