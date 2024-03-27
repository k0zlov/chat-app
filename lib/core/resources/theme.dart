import 'package:flutter/cupertino.dart';

class ApplicationTheme {
  const ApplicationTheme._();

  static CupertinoThemeData themeData({
    required Color color,
    required Brightness brightness,
  }) {
    return CupertinoThemeData(
      primaryColor: color,
      brightness: brightness,
    );
  }
}

enum AppThemeMode {
  system,
  light,
  dark,
}

enum AppThemeColor {
  standard,
  blue,
  green,
}

extension AppThemeColorExtension on AppThemeColor {
  Color get toColor {
    switch (this) {
      case AppThemeColor.standard:
      case AppThemeColor.blue:
        return CupertinoColors.activeBlue;
      case AppThemeColor.green:
        return CupertinoColors.activeGreen;
    }
  }
}
