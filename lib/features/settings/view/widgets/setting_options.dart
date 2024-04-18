import 'package:chat_app/core/navigation/navigation.dart';
import 'package:chat_app/core/resources/icons.dart';
import 'package:chat_app/features/settings/view/widgets/settings_options_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class SettingsOptions extends StatelessWidget {
  const SettingsOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 40, top: 20),
      sliver: SliverList.list(
        children: [
          CupertinoListSection.insetGrouped(
            children: [
              SettingsOptionsItem(
                onPressed: () {},
                leading: Padding(
                  padding: const EdgeInsets.only(bottom: 4, left: 2),
                  child: Icon(
                    CupertinoIcons.photo_camera,
                    color: CupertinoTheme.of(context).primaryColor,
                    size: 28,
                  ),
                ),
                title: 'Change profile picture',
                textColor: CupertinoTheme.of(context).primaryColor,
              ),
            ],
          ),
          CupertinoListSection.insetGrouped(
            children: [
              SettingsOptionsItem(
                onPressed: () {},
                leading: Image.asset(AppIcons.savedMessages.path, height: 35),
                title: 'Saved messages',
              ),
              SettingsOptionsItem(
                onPressed: () {},
                leading: Image.asset(AppIcons.resentCalls.path, height: 35),
                title: 'Recent calls',
              ),
              SettingsOptionsItem(
                onPressed: () {},
                leading: Image.asset(AppIcons.devices.path, height: 35),
                title: 'Devices',
              ),
              SettingsOptionsItem(
                onPressed: () {},
                leading: Image.asset(AppIcons.chatFolders.path, height: 35),
                title: 'Chat folders',
              ),
            ],
          ),
          CupertinoListSection.insetGrouped(
            children: [
              SettingsOptionsItem(
                onPressed: () {},
                leading:
                    Image.asset(AppIcons.notificationsAndSounds.path, height: 35),
                title: 'Notifications and Sounds',
              ),
              SettingsOptionsItem(
                onPressed: () {},
                leading:
                    Image.asset(AppIcons.privacyAndSecurity.path, height: 35),
                title: 'Privacy and Security',
              ),
              SettingsOptionsItem(
                onPressed: () {},
                leading: Image.asset(AppIcons.dataAndStorage.path, height: 35),
                title: 'Data and Storage',
              ),
              SettingsOptionsItem(
                onPressed: () => context.go(AppRoutes.appearanceSettings.path),
                leading: Image.asset(AppIcons.appearance.path, height: 35),
                title: 'Appearance',
              ),
              SettingsOptionsItem(
                onPressed: () {},
                leading: Image.asset(AppIcons.powerSaving.path, height: 35),
                title: 'Power Saving',
              ),
              SettingsOptionsItem(
                onPressed: () {},
                leading: Image.asset(AppIcons.language.path, height: 35),
                title: 'Language',
              ),
            ],
          ),
          CupertinoListSection.insetGrouped(
            children: [
              SettingsOptionsItem(
                onPressed: () {},
                leading: Image.asset(AppIcons.askQuestion.path),
                title: 'Ask a Question',
              ),
              SettingsOptionsItem(
                onPressed: () {},
                leading: Image.asset(AppIcons.telegramFaq.path, height: 35),
                title: 'Telegram FAQ',
              ),
              SettingsOptionsItem(
                onPressed: () {},
                leading: Image.asset(AppIcons.telegramFeatures.path, height: 35),
                title: 'Telegram Features',
              ),
            ],
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
