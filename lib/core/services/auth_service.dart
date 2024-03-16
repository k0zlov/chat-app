import 'dart:async';

import 'package:chat_app/utils/hive/hive_box.dart';

abstract interface class AuthService {
  Stream<bool> get authStateChanges;

  bool get isAuthorized;

  String? get getAccessToken;

  String? get getRefreshToken;

  Future<void> login(
      {required String accessToken, required String refreshToken});

  Future<void> logout();
}

class AuthServiceImpl implements AuthService {
  /// fd
  AuthServiceImpl({required this.hiveBoxMixin}) {
    _init();
  }

  final HiveBox hiveBoxMixin;

  final _authStateController = StreamController<bool>.broadcast();

  void _init() {
    final bool isAuthorized = hiveBoxMixin.isAuthorized;
    _authStateController.add(isAuthorized);
  }

  @override
  Stream<bool> get authStateChanges => _authStateController.stream;

  @override
  bool get isAuthorized => hiveBoxMixin.isAuthorized;

  @override
  String? get getAccessToken => hiveBoxMixin.getData<String?>(
        HiveBoxKeys.accessToken,
      );

  @override
  String? get getRefreshToken => hiveBoxMixin.getData<String?>(
        HiveBoxKeys.refreshToken,
      );

  @override
  Future<void> login({
    required String accessToken,
    required String refreshToken,
  }) async {
    await hiveBoxMixin.loginBox(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
    _authStateController.add(isAuthorized);
  }

  @override
  Future<void> logout() async {
    await hiveBoxMixin.logoutBox();
    _authStateController.add(isAuthorized);
  }
}
