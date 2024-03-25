import 'dart:async';

import 'package:chat_app/utils/hive/hive_box.dart';

abstract interface class AuthService {
  Stream<bool> get authStateChanges;

  bool get isAuthorized;

  String? get getAccessToken;

  String? get getRefreshToken;

  Future<void> login({
    required String accessToken,
    required String refreshToken,
  });

  Future<void> logout();
}

class AuthServiceImpl implements AuthService {
  /// fd
  AuthServiceImpl({required this.hiveBox}) {
    _init();
  }

  final HiveBox hiveBox;

  final _authStateController = StreamController<bool>.broadcast();

  void _init() {
    _authStateController.add(isAuthorized);
  }

  @override
  Stream<bool> get authStateChanges => _authStateController.stream;

  @override
  bool get isAuthorized => hiveBox.getData<bool?>(HiveBoxKeys.isLogin) ?? false;

  @override
  String? get getAccessToken => hiveBox.getData<String?>(
        HiveBoxKeys.accessToken,
      );

  @override
  String? get getRefreshToken => hiveBox.getData<String?>(
        HiveBoxKeys.refreshToken,
      );

  @override
  Future<void> login({
    required String accessToken,
    required String refreshToken,
  }) async {
    await hiveBox.addData(HiveBoxKeys.refreshToken, refreshToken);
    await hiveBox.addData(HiveBoxKeys.accessToken, accessToken);
    await hiveBox.addData(HiveBoxKeys.isLogin, true);

    _authStateController.add(isAuthorized);
  }

  @override
  Future<void> logout() async {
    await hiveBox.removeData(HiveBoxKeys.isLogin);
    await hiveBox.removeData(HiveBoxKeys.refreshToken);
    await hiveBox.removeData(HiveBoxKeys.accessToken);

    _authStateController.add(isAuthorized);
  }
}
