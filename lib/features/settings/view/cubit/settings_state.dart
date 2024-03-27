part of 'settings_cubit.dart';

class SettingsState {
  const SettingsState({
    this.themeMode = AppThemeMode.system,
    this.themeColor = AppThemeColor.standard,
  });

  final AppThemeMode themeMode;
  final AppThemeColor themeColor;

  Brightness? get getBrightness {
    switch (themeMode) {
      case AppThemeMode.system:
        return null;
      case AppThemeMode.light:
        return Brightness.light;
      case AppThemeMode.dark:
        return Brightness.dark;
    }
  }

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
