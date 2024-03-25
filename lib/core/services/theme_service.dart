import 'package:chat_app/utils/hive/hive_box.dart';

abstract interface class ThemeService {
  String? getThemeMode();

  String? getThemeColor();

  Future<void> setThemeMode({required String themeMode});

  Future<void> setThemeColor({required String themeColor});
}

class ThemeServiceImpl implements ThemeService {
  const ThemeServiceImpl({required this.hiveBox});

  final HiveBox hiveBox;

  @override
  String? getThemeColor() {
    return hiveBox.getData<String?>(HiveBoxKeys.themeColor);
  }

  @override
  String? getThemeMode() {
    return hiveBox.getData<String?>(HiveBoxKeys.themeMode);
  }

  @override
  Future<void> setThemeColor({required String themeColor}) async {
    await hiveBox.addData(HiveBoxKeys.themeColor, themeColor);
  }

  @override
  Future<void> setThemeMode({required String themeMode}) async {
    await hiveBox.addData(HiveBoxKeys.themeMode, themeMode);
  }
}
