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
      barBackgroundColor: AppPalette.lightBarBackground,
      textTheme: _cupertinoTextThemeData(
        primaryColor: color,
        textColor: AppPalette.lightText,
      ),
    );
  }

  static CupertinoThemeData cupertinoDark({required Color color}) {
    return CupertinoThemeData(
      primaryColor: color,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppPalette.darkScaffoldBackground,
      barBackgroundColor: AppPalette.darkBarBackground,
      textTheme: _cupertinoTextThemeData(
        primaryColor: color,
        textColor: AppPalette.darkText,
      ),
    );
  }

  static CupertinoTextThemeData _cupertinoTextThemeData({
    required Color primaryColor,
    required Color textColor,
  }) {
    return CupertinoTextThemeData(
      primaryColor: primaryColor,
      textStyle: TextStyle(
        color: textColor,
      ),
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
