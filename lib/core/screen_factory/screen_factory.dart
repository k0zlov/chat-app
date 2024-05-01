import 'package:chat_app/application.dart';
import 'package:chat_app/core/widgets/screens/bottom_nav_bar.dart';
import 'package:chat_app/di_container.dart';
import 'package:chat_app/features/auth/auth_feature.dart';
import 'package:chat_app/features/chats/view/cubit/chats_cubit.dart';
import 'package:chat_app/features/chats/view/screens/chat_screen.dart';
import 'package:chat_app/features/chats/view/screens/chats_listing_screen.dart';
import 'package:chat_app/features/contacts/view/cubit/contacts_cubit.dart';
import 'package:chat_app/features/contacts/view/screens/contacts_screen.dart';
import 'package:chat_app/features/settings/view/cubit/settings_cubit.dart';
import 'package:chat_app/features/settings/view/screens/appearance_screen.dart';
import 'package:chat_app/features/settings/view/screens/settings_screen.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<ContactsCubit>(),
        ),
        BlocProvider.value(
          value: getIt<ChatsCubit>(),
        ),
      ],
      child: AppBottomNavigationBar(navigationShell: navigationShell),
    );
  }

  static Widget renderChatsListingPage() {
    return const ChatsListingScreen();
  }

  static Widget renderChatPage({
    required int chatId,
  }) {
    return BlocProvider.value(
      value: getIt<ChatsCubit>(),
      child: ChatScreen(chatId: chatId),
    );
  }

  static Widget renderInitialScreen() {
    return const InitialScreen();
  }

  static Widget renderSettingsPage() {
    return const SettingsScreen();
  }

  static Widget renderSettingsAppearancePage() {
    return const SettingsAppearanceScreen();
  }

  static Widget renderContactsPage() {
    return const ContactsScreen();
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
