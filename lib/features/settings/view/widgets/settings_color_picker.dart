import 'package:chat_app/core/resources/theme.dart';
import 'package:chat_app/features/settings/view/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsColorPicker extends StatelessWidget {
  const SettingsColorPicker({super.key});

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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          height: 30,
          width: 30,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.fromBorderSide(
              BorderSide(
                width: 2,
                color: selected ? color : Colors.transparent,
              ),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
