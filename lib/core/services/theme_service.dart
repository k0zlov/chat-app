import 'package:chat_app/core/resources/theme.dart';
import 'package:chat_app/utils/enum_parsing/enum_parsing_extension.dart';
import 'package:chat_app/utils/hive/hive_box.dart';

abstract interface class ThemeService {
  AppThemeMode? getThemeMode();

  AppThemeColor? getThemeColor();

  Future<void> setThemeMode({required AppThemeMode themeMode});

  Future<void> setThemeColor({required AppThemeColor themeColor});
}

class ThemeServiceImpl implements ThemeService {
  const ThemeServiceImpl({required this.hiveBox});

  final HiveBox hiveBox;

  @override
  AppThemeMode? getThemeMode() {
    final String? modeName = hiveBox.getData<String?>(HiveBoxKeys.themeMode);
    final AppThemeMode? themeMode = AppThemeMode.values.valueFromString(
      modeName,
    );
    return themeMode;
  }

  @override
  AppThemeColor? getThemeColor() {
    final String? colorName = hiveBox.getData<String?>(HiveBoxKeys.themeColor);
    final AppThemeColor? themeColor = AppThemeColor.values.valueFromString(
      colorName,
    );
    return themeColor;
  }

  @override
  Future<void> setThemeMode({required AppThemeMode themeMode}) async {
    await hiveBox.addData(HiveBoxKeys.themeMode, themeMode.name);
  }

  @override
  Future<void> setThemeColor({required AppThemeColor themeColor}) async {
    await hiveBox.addData(HiveBoxKeys.themeColor, themeColor.name);
  }
}
