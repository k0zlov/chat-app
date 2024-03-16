import 'dart:async';

import 'package:chat_app/utils/hive/hive_box.dart';

abstract interface class AuthService {
  Stream<bool> get authStateChanges;

  bool get isAuthorized;

  String? get getToken;

  Future<void> login({required String token});

  Future<void> logout();
}

class AuthServiceImpl implements AuthService {
  /// fd
  AuthServiceImpl({required this.hiveBoxMixin}) {
    _init();
  }

  final HiveBoxMixin hiveBoxMixin;

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
  String? get getToken => hiveBoxMixin.getData<String?>(HiveBoxKeys.token);

  @override
  Future<void> login({required String token}) async {
    await hiveBoxMixin.loginBox(token: token);
    _authStateController.add(isAuthorized);
  }

  @override
  Future<void> logout() async {
    await hiveBoxMixin.logoutBox();
    _authStateController.add(isAuthorized);
  }
}
