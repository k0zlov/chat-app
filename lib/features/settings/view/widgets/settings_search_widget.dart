import 'package:chat_app/core/resources/icons.dart';
import 'package:chat_app/core/widgets/search/search_results_header.dart';
import 'package:chat_app/features/settings/view/widgets/setting_options.dart';
import 'package:chat_app/features/settings/view/widgets/settings_options_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsSearchWidget extends StatelessWidget {
  const SettingsSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.list(
      children: [
        const SearchResultsHeader(title: 'Settings'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SettingsOptionsBox(
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
        ),
      ],
    );
  }
}
