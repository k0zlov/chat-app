import 'package:chat_app/features/settings/settings_feature.dart';
import 'package:chat_app/features/settings/view/widgets/setting_options.dart';
import 'package:chat_app/features/settings/view/widgets/settings_color_picker.dart';
import 'package:chat_app/features/settings/view/widgets/settings_options_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsAppearanceScreen extends StatelessWidget {
  const SettingsAppearanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Appearance'),
        previousPageTitle: 'Back',
      ),
      child: CupertinoScrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'COLOR THEME',
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .textStyle
                          .copyWith(
                            fontSize: 12,
                            color: CupertinoColors.inactiveGray,
                          ),
                    ),
                  ),
                ),
                const SettingsOptionsBox(
                  children: [
                    SettingsColorPicker(),
                    SettingsOptionsItem(
                      divider: true,
                      title: 'Night mode',
                      trailing: SettingsNightModeSwitch(),
                      trailingArrow: false,
                      roundedTopBorder: false,
                      roundedBottomBorder: false,
                      onPressed: null,
                      padding: EdgeInsets.symmetric(vertical: 4),
                    ),
                    SettingsOptionsItem(
                      divider: false,
                      title: 'System mode',
                      trailingArrow: false,
                      roundedTopBorder: false,
                      roundedBottomBorder: true,
                      onPressed: null,
                      trailing: SettingsSystemModeSwitch(),
                      padding: EdgeInsets.symmetric(vertical: 4),

                    ),
                  ],
                ),
              ],
            ),
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
