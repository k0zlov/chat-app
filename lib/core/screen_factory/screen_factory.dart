import 'package:chat_app/application.dart';
import 'package:chat_app/core/widgets/mock_up_chats.dart';
import 'package:chat_app/core/widgets/mock_up_contacts.dart';
import 'package:chat_app/core/widgets/mock_up_nav_bar.dart';
import 'package:chat_app/core/widgets/mock_up_settings.dart';
import 'package:chat_app/di_container.dart';
import 'package:chat_app/features/auth/auth_feature.dart';
import 'package:chat_app/features/settings/view/cubit/settings_cubit.dart';
import 'package:flutter/cupertino.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<AuthCubit>()),
        BlocProvider(create: (context) => getIt<SettingsCubit>()),
      ],
      child: const ChatApplication(),
    );
  }
}
