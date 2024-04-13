import 'package:chat_app/core/screen_factory/screen_factory.dart';
import 'package:chat_app/di_container.dart';
import 'package:chat_app/features/contacts/domain/repositories/contacts_repository.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await registerDependencies();

  final test = await getIt<ContactsRepository>().getAllContacts();
  print(test);

  runApp(ScreenFactory.renderApplication());
}
