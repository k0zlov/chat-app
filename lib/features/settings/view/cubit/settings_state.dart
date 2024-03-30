part of 'settings_cubit.dart';

class SettingsState {
  const SettingsState({
    this.usingSystemBrightness = true,
    this.currentBrightness = Brightness.light,
    this.themeColor = AppThemeColor.standard,
  });

  final AppThemeColor themeColor;

  final Brightness currentBrightness;
  final bool usingSystemBrightness;

  SettingsState copyWith({
    AppThemeColor? themeColor,
    Brightness? currentBrightness,
    bool? usingSystemBrightness,
  }) {
    return SettingsState(
      themeColor: themeColor ?? this.themeColor,
      currentBrightness: currentBrightness ?? this.currentBrightness,
      usingSystemBrightness:
          usingSystemBrightness ?? this.usingSystemBrightness,
    );
  }
}
