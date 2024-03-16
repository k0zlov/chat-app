import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';

class HiveBox {
  static Box<dynamic>? _mainBox;

  /// The name of the application's storage box.
  static const String _boxName = 'application_storage';

  /// Initializes Hive and opens the main storage box.
  static Future<void> initHive() async {
    await Hive.initFlutter();
    _mainBox = await Hive.openBox(_boxName);
  }
  /// Adds data to the main storage box with the specified [key] and [value].
  Future<void> addData<T>(HiveBoxKeys key, T value) async {
    await _mainBox?.put(key.name, value);
  }

  /// Removes data from the main storage box
  /// associated with the specified [key].
  Future<void> removeData(HiveBoxKeys key) async {
    await _mainBox?.delete(key.name);
  }

  bool get isAuthorized => getData<bool?>(HiveBoxKeys.isLogin) ?? false;

  /// Retrieves data of type [T] from the main storage box
  /// associated with the specified [key].
  T getData<T>(HiveBoxKeys key) => _mainBox?.get(key.name) as T;

  Future<void> loginBox({required String token}) async {
    await addData(HiveBoxKeys.token, token);
    await addData(HiveBoxKeys.isLogin, true);
  }

  /// Clears user-related data from the main storage box to handle logout.
  Future<void> logoutBox() async {
    await removeData(HiveBoxKeys.isLogin);
    await removeData(HiveBoxKeys.token);
  }

  /// Closes and optionally deletes the main storage box.
  Future<void> closeBox() async {
    try {
      if (_mainBox == null) return;
      await _mainBox?.close();
      await _mainBox?.deleteFromDisk();
    } catch (e, stackTrace) {
      if(kDebugMode) {
        print('Error: $e\nStack trace:\n$stackTrace');
      }
    }
  }
}

/// Enumerated keys used to store and retrieve data from the main Hive box.
enum HiveBoxKeys {
  /// The key for the user's authentication token.
  token,

  /// The key indicating whether the user is logged in.
  isLogin,
}
