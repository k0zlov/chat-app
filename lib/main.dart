import 'package:chat_app/application.dart';
import 'package:chat_app/di_container.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await registerDependencies();

  /// Initializing Supabase
  const supabaseUrl = 'https://pyjduiurropblpsqzgzs.supabase.co';
  const supabaseKey = String.fromEnvironment('SUPABASE_KEY');
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
  );

  runApp(const MyApp());
}
