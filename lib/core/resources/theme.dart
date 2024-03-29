import 'package:flutter/cupertino.dart';

class ApplicationTheme {
  const ApplicationTheme._();

  static CupertinoThemeData themeData({
    required Color color,
    required Brightness brightness,
  }) {
    return brightness == Brightness.dark
        ? cupertinoDark(color: color)
        : cupertinoLight(color: color);
  }

  static CupertinoThemeData cupertinoLight({required Color color}) {
    return CupertinoThemeData(
      primaryColor: color,
      brightness: Brightness.light,
      scaffoldBackgroundColor: CupertinoColors.white,
    );
  }

  static CupertinoThemeData cupertinoDark({required Color color}) {
    return CupertinoThemeData(
      primaryColor: color,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: CupertinoColors.darkBackgroundGray,
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
