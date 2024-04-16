import 'package:chat_app/core/navigation/navigation.dart';
import 'package:chat_app/core/resources/icons.dart';
import 'package:chat_app/core/widgets/chat_app_tile.dart';
import 'package:chat_app/core/widgets/screens/bottom_nav_bar.dart';
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
            ChatAppTile(
              onPressed: () {},
              hasDivider: false,
              leading: Icon(
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
            ChatAppTile(
              onPressed: () {},
              hasDivider: true,
              leading: Image.asset(AppIcons.savedMessages.path, height: 35),
              title: 'Saved messages',
              hasTopBorder: true,
              hasBottomBorder: false,
            ),
            ChatAppTile(
              onPressed: () {},
              hasDivider: true,
              leading: Image.asset(AppIcons.resentCalls.path, height: 35),
              title: 'Recent calls',
              hasTopBorder: false,
              hasBottomBorder: false,
            ),
            ChatAppTile(
              onPressed: () {},
              hasDivider: true,
              leading: Image.asset(AppIcons.devices.path, height: 35),
              title: 'Devices',
              hasTopBorder: false,
              hasBottomBorder: false,
            ),
            ChatAppTile(
              onPressed: () {},
              hasDivider: false,
              leading: Image.asset(AppIcons.chatFolders.path, height: 35),
              title: 'Chat folders',
              hasTopBorder: false,
              hasBottomBorder: true,
            ),
          ],
        ),
        SettingsOptionsBox(
          children: [
            ChatAppTile(
              onPressed: () {},
              hasDivider: true,
              leading: Image.asset(AppIcons.notificationsAndSounds.path, height: 35),
              title: 'Notifications and Sounds',
              hasTopBorder: true,
              hasBottomBorder: false,
            ),
            ChatAppTile(
              onPressed: () {},
              hasDivider: true,
              leading: Image.asset(AppIcons.privacyAndSecurity.path, height: 35),
              title: 'Privacy and Security',
              hasTopBorder: false,
              hasBottomBorder: false,
            ),
            ChatAppTile(
              onPressed: () {},
              hasDivider: true,
              leading: Image.asset(AppIcons.dataAndStorage.path, height: 35),
              title: 'Data and Storage',
              hasTopBorder: false,
              hasBottomBorder: false,
            ),
            ChatAppTile(
              onPressed: () => context.go(AppRoutes.appearanceSettings.path),
              hasDivider: true,
              leading: Image.asset(AppIcons.appearance.path, height: 35),
              title: 'Appearance',
              hasTopBorder: false,
              hasBottomBorder: false,
            ),
            ChatAppTile(
              onPressed: () {},
              hasDivider: true,
              leading: Image.asset(AppIcons.powerSaving.path, height: 35),
              title: 'Power Saving',
              hasTopBorder: false,
              hasBottomBorder: false,
            ),
            ChatAppTile(
              onPressed: () {},
              hasDivider: false,
              leading: Image.asset(AppIcons.language.path, height: 35),
              title: 'Language',
              hasTopBorder: false,
              hasBottomBorder: true,
            ),
          ],
        ),
        SettingsOptionsBox(
          children: [
            ChatAppTile(
              onPressed: () {},
              hasDivider: true,
              leading: Image.asset(AppIcons.askQuestion.path, height: 35),
              title: 'Ask a Question',
              hasTopBorder: true,
              hasBottomBorder: false,
            ),
            ChatAppTile(
              onPressed: () {},
              hasDivider: true,
              leading: Image.asset(AppIcons.telegramFaq.path, height: 35),
              title: 'Telegram FAQ',
              hasTopBorder: false,
              hasBottomBorder: false,
            ),
            ChatAppTile(
              onPressed: () {
                final navBarProvider = NavBarVisibilityProvider.of(context);

                navBarProvider?.setVisibility(value: !navBarProvider.isVisible);
              },
              hasDivider: false,
              leading: Image.asset(AppIcons.telegramFeatures.path, height: 35),
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
