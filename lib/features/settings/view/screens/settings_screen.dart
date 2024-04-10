import 'package:chat_app/features/settings/view/widgets/setting_options.dart';
import 'package:chat_app/features/settings/view/widgets/settings_app_bar.dart';
import 'package:flutter/cupertino.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return CupertinoPageScaffold(
      child: CustomScrollView(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SettingsAppBar(
            key: UniqueKey(),
            scrollController: scrollController,
          ),
          const SliverPadding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 2,
              bottom: 40,
            ),
            sliver: SettingsOptions(),
          ),
        ],
      ),
    );
  }
}
