import 'package:chat_app/core/resources/icons.dart';
import 'package:chat_app/features/settings/view/widgets/setting_options_item.dart';
import 'package:flutter/cupertino.dart';

class SettingsOptions extends StatelessWidget {
  const SettingsOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.list(
      children: [
        SettingsOptionsBox(
          children: [
            SettingsMenuOption(
              onPressed: () {},
              hasDivider: false,
              icon: Icon(
                CupertinoIcons.photo_camera,
                color: CupertinoTheme.of(context).primaryColor,
                size: 28,
              ),
              title: 'Change profile picture',
              hasTopBorder: true,
              hasBottomBorder: true,
              textColor: CupertinoTheme.of(context).primaryColor,
            ),
          ],
        ),
        SettingsOptionsBox(
          children: [
            SettingsMenuOption(
              onPressed: () {},
              hasDivider: true,
              iconData: AppIcons.savedMessages,
              title: 'Saved messages',
              hasTopBorder: true,
              hasBottomBorder: false,
            ),
            SettingsMenuOption(
              onPressed: () {},
              hasDivider: true,
              iconData: AppIcons.resentCalls,
              title: 'Recent calls',
              hasTopBorder: false,
              hasBottomBorder: false,
            ),
            SettingsMenuOption(
              onPressed: () {},
              hasDivider: true,
              iconData: AppIcons.devices,
              title: 'Devices',
              hasTopBorder: false,
              hasBottomBorder: false,
            ),
            SettingsMenuOption(
              onPressed: () {},
              hasDivider: false,
              iconData: AppIcons.chatFolders,
              title: 'Chat folders',
              hasTopBorder: false,
              hasBottomBorder: true,
            ),
          ],
        ),
        SettingsOptionsBox(
          children: [
            SettingsMenuOption(
              onPressed: () {},
              hasDivider: true,
              iconData: AppIcons.notificationsAndSounds,
              title: 'Notifications and Sounds',
              hasTopBorder: true,
              hasBottomBorder: false,
            ),
            SettingsMenuOption(
              onPressed: () {},
              hasDivider: true,
              iconData: AppIcons.privacyAndSecurity,
              title: 'Privacy and Security',
              hasTopBorder: false,
              hasBottomBorder: false,
            ),
            SettingsMenuOption(
              onPressed: () {},
              hasDivider: true,
              iconData: AppIcons.dataAndStorage,
              title: 'Data and Storage',
              hasTopBorder: false,
              hasBottomBorder: false,
            ),
            SettingsMenuOption(
              onPressed: () {},
              hasDivider: true,
              iconData: AppIcons.appearance,
              title: 'Appearance',
              hasTopBorder: false,
              hasBottomBorder: false,
            ),
            SettingsMenuOption(
              onPressed: () {},
              hasDivider: true,
              iconData: AppIcons.powerSaving,
              title: 'Power Saving',
              hasTopBorder: false,
              hasBottomBorder: false,
            ),
            SettingsMenuOption(
              onPressed: () {},
              hasDivider: false,
              iconData: AppIcons.language,
              title: 'Language',
              hasTopBorder: false,
              hasBottomBorder: true,
            ),
          ],
        ),
        SettingsOptionsBox(
          children: [
            SettingsMenuOption(
              onPressed: () {},
              hasDivider: true,
              iconData: AppIcons.askQuestion,
              title: 'Ask a Question',
              hasTopBorder: true,
              hasBottomBorder: false,
            ),
            SettingsMenuOption(
              onPressed: () {},
              hasDivider: true,
              iconData: AppIcons.telegramFaq,
              title: 'Telegram FAQ',
              hasTopBorder: false,
              hasBottomBorder: false,
            ),
            SettingsMenuOption(
              onPressed: () {},
              hasDivider: false,
              iconData: AppIcons.telegramFeatures,
              title: 'Telegram Features',
              hasTopBorder: false,
              hasBottomBorder: true,
            ),
          ],
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}

class SettingsOptionsBox extends StatelessWidget {
  const SettingsOptionsBox({
    super.key,
    required this.children,
  });

  final List<SettingsMenuOption> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: children,
      ),
    );
  }
}
