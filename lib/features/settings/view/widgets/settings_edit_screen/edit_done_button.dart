import 'package:chat_app/core/navigation/navigation.dart';
import 'package:chat_app/core/widgets/buttons/cupertino_done_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class SettingsEditDoneButton extends StatelessWidget {
  const SettingsEditDoneButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: CupertinoDoneButton(
        onPressed: () => context.go(AppRoutes.settings.path),
      ),
    );
  }
}
