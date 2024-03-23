import 'package:chat_app/application.dart';
import 'package:chat_app/core/widgets/mock_up_chats.dart';
import 'package:chat_app/core/widgets/mock_up_contacts.dart';
import 'package:chat_app/core/widgets/mock_up_nav_bar.dart';
import 'package:chat_app/core/widgets/mock_up_settings.dart';
import 'package:chat_app/di_container.dart';
import 'package:chat_app/features/auth/view/cubit/auth_cubit.dart';
import 'package:chat_app/features/auth/view/screens/init_screen.dart';
import 'package:chat_app/features/auth/view/screens/login_screen.dart';
import 'package:chat_app/features/auth/view/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ScreenFactory {
  ScreenFactory._();

  static Widget renderLoginScreen() {
    return const LoginScreen();
  }

  static Widget renderRegistrationScreen() {
    return const RegistrationScreen();
  }

  static Widget renderBottomNavBar(StatefulNavigationShell navigationShell) {
    return ChatAppNavigationBar(navigationShell: navigationShell);
  }

  static Widget renderChatsPage() {
    return const MockUpChats();
  }

  static Widget renderInitialScreen() {
    return const InitialScreen();
  }

  static Widget renderSettingsPage() {
    return const MockUpSettings();
  }

  static Widget renderContactsPage() {
    return const MockUpContacts();
  }

  static Widget renderApplication() {
    return BlocProvider.value(
      value: getIt<AuthCubit>(),
      child: const ChatApplication(),
    );
  }
}
