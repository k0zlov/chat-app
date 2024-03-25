part of 'settings_cubit.dart';

class SettingsState {
  const SettingsState({
    this.themeMode = AppThemeMode.system,
    this.themeColor = AppThemeColor.standart,
  });

  final AppThemeMode themeMode;
  final AppThemeColor themeColor;

  SettingsState copyWith({
    AppThemeMode? themeMode,
    AppThemeColor? themeColor,
  }) {
    return SettingsState(
      themeMode: themeMode ?? this.themeMode,
      themeColor: themeColor ?? this.themeColor,
    );
  }
}
