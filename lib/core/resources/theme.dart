import 'package:chat_app/core/resources/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      scaffoldBackgroundColor: AppPalette.lightScaffoldBackground,
    );
  }

  static CupertinoThemeData cupertinoDark({required Color color}) {
    return CupertinoThemeData(
      primaryColor: color,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppPalette.darkScaffoldBackground,
    );
  }
}

enum AppThemeColor {
  standard(AppPalette.blueThemePrimary),
  blue(AppPalette.blueThemePrimary),
  green(AppPalette.greenThemePrimary);

  const AppThemeColor(this.color);

  final Color color;
}
