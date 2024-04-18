import 'package:chat_app/core/resources/icons.dart';
import 'package:chat_app/core/widgets/search/search_results_header.dart';
import 'package:chat_app/features/settings/view/widgets/settings_options_item.dart';
import 'package:flutter/cupertino.dart';

class SettingsSearchWidget extends StatelessWidget {
  const SettingsSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.list(
      children: [
        const SearchResultsHeader(title: 'Settings'),
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
      ],
    );
  }
}
