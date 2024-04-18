import 'package:chat_app/core/navigation/navigation.dart';
import 'package:chat_app/core/resources/icons.dart';
import 'package:chat_app/core/widgets/screens/bottom_nav_bar.dart';
import 'package:chat_app/features/settings/view/widgets/settings_options_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class SettingsOptions extends StatelessWidget {
  const SettingsOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.list(
      children: [
        SettingsOptionsBox(
          children: [
            SettingsOptionsItem(
              onPressed: () {},
              divider: false,
              leading: Padding(
                padding: const EdgeInsets.only(bottom: 4, left: 2),
                child: Icon(
                  CupertinoIcons.photo_camera,
                  color: CupertinoTheme.of(context).primaryColor,
                  size: 28,
                ),
              ),
              title: 'Change profile picture',
              roundedTopBorder: true,
              roundedBottomBorder: true,
              textColor: CupertinoTheme.of(context).primaryColor,
            ),
          ],
        ),
        SettingsOptionsBox(
          children: [
            SettingsOptionsItem(
              onPressed: () {},
              divider: true,
              leading: Image.asset(AppIcons.savedMessages.path, height: 35),
              title: 'Saved messages',
              roundedTopBorder: true,
              roundedBottomBorder: false,
            ),
            SettingsOptionsItem(
              onPressed: () {},
              divider: true,
              leading: Image.asset(AppIcons.resentCalls.path, height: 35),
              title: 'Recent calls',
              roundedTopBorder: false,
              roundedBottomBorder: false,
            ),
            SettingsOptionsItem(
              onPressed: () {},
              divider: true,
              leading: Image.asset(AppIcons.devices.path, height: 35),
              title: 'Devices',
              roundedTopBorder: false,
              roundedBottomBorder: false,
            ),
            SettingsOptionsItem(
              onPressed: () {},
              divider: false,
              leading: Image.asset(AppIcons.chatFolders.path, height: 35),
              title: 'Chat folders',
              roundedTopBorder: false,
              roundedBottomBorder: true,
            ),
          ],
        ),
        SettingsOptionsBox(
          children: [
            SettingsOptionsItem(
              onPressed: () {},
              divider: true,
              leading: Image.asset(AppIcons.notificationsAndSounds.path, height: 35),
              title: 'Notifications and Sounds',
              roundedTopBorder: true,
              roundedBottomBorder: false,
            ),
            SettingsOptionsItem(
              onPressed: () {},
              divider: true,
              leading: Image.asset(AppIcons.privacyAndSecurity.path, height: 35),
              title: 'Privacy and Security',
              roundedTopBorder: false,
              roundedBottomBorder: false,
            ),
            SettingsOptionsItem(
              onPressed: () {},
              divider: true,
              leading: Image.asset(AppIcons.dataAndStorage.path, height: 35),
              title: 'Data and Storage',
              roundedTopBorder: false,
              roundedBottomBorder: false,
            ),
            SettingsOptionsItem(
              onPressed: () => context.go(AppRoutes.appearanceSettings.path),
              divider: true,
              leading: Image.asset(AppIcons.appearance.path, height: 35),
              title: 'Appearance',
              roundedTopBorder: false,
              roundedBottomBorder: false,
            ),
            SettingsOptionsItem(
              onPressed: () {},
              divider: true,
              leading: Image.asset(AppIcons.powerSaving.path, height: 35),
              title: 'Power Saving',
              roundedTopBorder: false,
              roundedBottomBorder: false,
            ),
            SettingsOptionsItem(
              onPressed: () {},
              divider: false,
              leading: Image.asset(AppIcons.language.path, height: 35),
              title: 'Language',
              roundedTopBorder: false,
              roundedBottomBorder: true,
            ),
          ],
        ),
        SettingsOptionsBox(
          children: [
            SettingsOptionsItem(
              onPressed: () {},
              divider: true,
              leading: Image.asset(AppIcons.askQuestion.path, height: 35),
              title: 'Ask a Question',
              roundedTopBorder: true,
              roundedBottomBorder: false,
            ),
            SettingsOptionsItem(
              onPressed: () {},
              divider: true,
              leading: Image.asset(AppIcons.telegramFaq.path, height: 35),
              title: 'Telegram FAQ',
              roundedTopBorder: false,
              roundedBottomBorder: false,
            ),
            SettingsOptionsItem(
              onPressed: () {
                final navBarProvider = NavBarVisibilityProvider.of(context);

                navBarProvider?.setVisibility(value: !navBarProvider.isVisible);
              },
              divider: false,
              leading: Image.asset(AppIcons.telegramFeatures.path, height: 35),
              title: 'Telegram Features',
              roundedTopBorder: false,
              roundedBottomBorder: true,
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

  final List<Widget> children;

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
