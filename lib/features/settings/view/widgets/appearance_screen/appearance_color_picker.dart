import 'package:chat_app/core/resources/theme.dart';
import 'package:chat_app/features/settings/view/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppearanceColorPicker extends StatelessWidget {
  const AppearanceColorPicker({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsCubit cubit = context.read<SettingsCubit>();
    final SettingsState state = context.select(
      (SettingsCubit cubit) => cubit.state,
    );

    return Container(
      padding: const EdgeInsets.all(8),
      height: 60,
      child: Row(
        children: [
          SettingsColorPickerItem(
            color: AppThemeColor.blue.color,
            selected: state.themeColor == AppThemeColor.blue ||
                state.themeColor == AppThemeColor.standard,
            onPressed: () async => cubit.setThemeColor(AppThemeColor.blue),
          ),
          SettingsColorPickerItem(
            color: AppThemeColor.green.color,
            selected: state.themeColor == AppThemeColor.green,
            onPressed: () async => cubit.setThemeColor(AppThemeColor.green),
          ),
        ],
      ),
    );
  }
}

class SettingsColorPickerItem extends StatelessWidget {
  const SettingsColorPickerItem({
    super.key,
    required this.color,
    required this.selected,
    required this.onPressed,
  });

  final Color color;
  final bool selected;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 240),
          height: 28,
          width: 28,
          padding: EdgeInsets.all(selected ? 3 : 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            border: Border.fromBorderSide(
              BorderSide(
                width: 2,
                color: color,
              ),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}
