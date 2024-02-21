import 'package:chat_app/application.dart';
import 'package:chat_app/di_container.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await registerDependencies();
  runApp(const MyApp());
}