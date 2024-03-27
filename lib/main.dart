import 'package:chat_app/core/screen_factory/screen_factory.dart';
import 'package:chat_app/core/services/theme_service.dart';
import 'package:chat_app/di_container.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await registerDependencies();

  runApp(ScreenFactory.renderApplication());
}
