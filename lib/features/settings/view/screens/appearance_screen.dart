import 'package:chat_app/core/navigation/navigation.dart';
import 'package:chat_app/features/settings/settings_feature.dart';
import 'package:chat_app/features/settings/view/widgets/settings_color_picker.dart';
import 'package:chat_app/features/settings/view/widgets/settings_options_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SettingsAppearanceScreen extends StatelessWidget {
  const SettingsAppearanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = CupertinoTheme.of(context).textTheme.textStyle.copyWith(
      fontSize: 10,
      color: CupertinoColors.systemGrey,
    );

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Appearance'),
        leading: CupertinoNavigationBarBackButton(
          previousPageTitle: 'Back',
          onPressed: () => context.go(AppRoutes.settings.path),
        ),
      ),
      child: CupertinoScrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CupertinoListSection.insetGrouped(
                header: Text('COLOR THEME', style: textStyle),
                children: const [
                  SettingsColorPicker(),
                  SettingsOptionsItem(
                    title: 'Night mode',
                    trailing: SettingsNightModeSwitch(),
                    trailingArrow: false,
                    onPressed: null,
                  ),
                  SettingsOptionsItem(
                    title: 'System mode',
                    trailingArrow: false,
                    onPressed: null,
                    trailing: SettingsSystemModeSwitch(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsSystemModeSwitch extends StatelessWidget {
  const SettingsSystemModeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsCubit cubit = context.read<SettingsCubit>();
    final SettingsState state = context.select(
      (SettingsCubit cubit) => cubit.state,
    );

    return CupertinoSwitch(
      value: state.usingSystemBrightness,
      onChanged: (bool value) => cubit.switchUsingSystemMode(),
    );
  }
}

class SettingsNightModeSwitch extends StatelessWidget {
  const SettingsNightModeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsCubit cubit = context.read<SettingsCubit>();
    final SettingsState state = context.select(
      (SettingsCubit cubit) => cubit.state,
    );

    return CupertinoSwitch(
      value: state.currentBrightness == Brightness.dark,
      onChanged: state.usingSystemBrightness
          ? null
          : (bool value) => cubit.switchThemeMode(),
    );
  }
}
