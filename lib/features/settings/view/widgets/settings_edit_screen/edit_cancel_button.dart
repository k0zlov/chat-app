import 'package:chat_app/core/navigation/navigation.dart';
import 'package:chat_app/core/widgets/buttons/cupertino_cancel_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class SettingsEditCancelButton extends StatelessWidget {
  const SettingsEditCancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: CupertinoCancelButton(
        onPressed: () => context.go(AppRoutes.settings.path),
      ),
    );
  }
}
