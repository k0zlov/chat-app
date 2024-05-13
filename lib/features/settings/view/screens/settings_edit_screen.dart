import 'package:chat_app/core/navigation/navigation.dart';
import 'package:chat_app/core/widgets/screens/edit_screen/edit_screen.dart';
import 'package:chat_app/core/widgets/screens/edit_screen/edit_set_new_photo_button.dart';
import 'package:chat_app/features/settings/view/widgets/settings_edit_screen/account_manage_section.dart';
import 'package:chat_app/features/settings/view/widgets/settings_edit_screen/auth_actions_section.dart';
import 'package:chat_app/features/settings/view/widgets/settings_edit_screen/bio_section.dart';
import 'package:chat_app/features/settings/view/widgets/settings_edit_screen/birth_date_section.dart';
import 'package:chat_app/features/settings/view/widgets/settings_edit_screen/name_section.dart';
import 'package:chat_app/features/settings/view/widgets/settings_screen/settings_user_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class SettingsEditScreen extends StatelessWidget {
  const SettingsEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EditScreen(
      onDone: () {},
      onCancel: () => context.go(AppRoutes.settings.path),
      sliverBody: const _SettingsEditScreenBody(),
    );
  }
}

class _SettingsEditScreenBody extends StatelessWidget {
  const _SettingsEditScreenBody();

  @override
  Widget build(BuildContext context) {
    return SliverList.list(
      children: [
        SettingsUserImage(
          expanded: false,
          onImagePressed: () {},
        ),
        EditScreenSetNewPhotoButton(onPressed: () {}),
        const SettingsEditNameSection(),
        const SettingsEditBioSection(),
        const SettingsEditBirthDateSection(),
        const SettingsEditAccountManageSection(),
        const SettingsEditAuthActionsSection(),
      ],
    );
  }
}
