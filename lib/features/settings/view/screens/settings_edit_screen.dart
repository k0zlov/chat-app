import 'package:chat_app/features/settings/view/widgets/settings_edit_screen/account_manage_section.dart';
import 'package:chat_app/features/settings/view/widgets/settings_edit_screen/auth_actions_section.dart';
import 'package:chat_app/features/settings/view/widgets/settings_edit_screen/bio_section.dart';
import 'package:chat_app/features/settings/view/widgets/settings_edit_screen/birth_date_section.dart';
import 'package:chat_app/features/settings/view/widgets/settings_edit_screen/edit_app_bar.dart';
import 'package:chat_app/features/settings/view/widgets/settings_edit_screen/edit_set_new_photo_button.dart';
import 'package:chat_app/features/settings/view/widgets/settings_edit_screen/name_section.dart';
import 'package:chat_app/features/settings/view/widgets/settings_screen/settings_user_image.dart';
import 'package:flutter/cupertino.dart';

class SettingsEditScreen extends StatefulWidget {
  const SettingsEditScreen({super.key});

  @override
  State<SettingsEditScreen> createState() => _SettingsEditScreenState();
}

class _SettingsEditScreenState extends State<SettingsEditScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SettingsEditAppBar(
            scrollController: _scrollController,
          ),
          const _SettingsEditScreenBody(),
        ],
      ),
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
        const SettingsEditSetNewPhotoButton(),
        const SettingsEditNameSection(),
        const SettingsEditBioSection(),
        const SettingsEditBirthDateSection(),
        const SettingsEditAccountManageSection(),
        const SettingsEditAuthActionsSection(),
      ],
    );
  }
}
