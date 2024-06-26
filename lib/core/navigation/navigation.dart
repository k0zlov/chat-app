import 'package:chat_app/core/navigation/navigation_stream.dart';
import 'package:chat_app/core/screen_factory/screen_factory.dart';
import 'package:chat_app/core/services/auth_service.dart';
import 'package:chat_app/di_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavigation {
  AppNavigation._();

  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    routerNeglect: true,
    initialLocation: AppRoutes.root.path,
    navigatorKey: rootNavigatorKey,
    refreshListenable: NavigationRefreshStream(
      stream: getIt<AuthService>().authStateChanges,
    ),
    redirect: (BuildContext context, GoRouterState state) {
      final String location = state.matchedLocation;

      final bool isAuthPage = location == AppRoutes.login.path ||
          location == AppRoutes.registration.path ||
          location == AppRoutes.auth.path;

      final bool isAuthorized = getIt<AuthService>().isAuthorized;

      if (isAuthPage && isAuthorized) {
        return AppRoutes.chats.path;
      }

      if (!isAuthorized && !isAuthPage) {
        return AppRoutes.auth.path;
      }

      if (state.matchedLocation == '/') {
        return AppRoutes.auth.path;
      }

      return null;
    },
    routes: _routes,
  );

  static final List<RouteBase> _routes = <RouteBase>[
    GoRoute(
      name: AppRoutes.auth.name,
      path: AppRoutes.auth.path,
      builder: (context, state) => ScreenFactory.renderInitialScreen(),
      routes: [
        GoRoute(
          name: AppRoutes.login.name,
          path: AppRoutes.login.name,
          builder: (context, state) => ScreenFactory.renderLoginScreen(),
        ),
        GoRoute(
          name: AppRoutes.registration.name,
          path: AppRoutes.registration.name,
          builder: (context, state) {
            return ScreenFactory.renderRegistrationScreen();
          },
        ),
      ],
    ),
    GoRoute(
      name: AppRoutes.appearanceSettings.name,
      path: AppRoutes.appearanceSettings.path,
      builder: (context, state) {
        return ScreenFactory.renderSettingsAppearancePage();
      },
    ),
    GoRoute(
      name: AppRoutes.editSettings.name,
      path: AppRoutes.editSettings.path,
      builder: (context, state) {
        return ScreenFactory.renderSettingsEditScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.chat.path,
      name: AppRoutes.chat.name,
      builder: (context, state) {
        final String? chatId = state.pathParameters['chatId'];

        return ScreenFactory.renderChatPage(
          chatId: int.tryParse(chatId ?? '-1') ?? -1,
        );
      },
      routes: [
        GoRoute(
          path: AppRoutes.chatEdit.name,
          name: AppRoutes.chatEdit.name,
          builder: (context, state) {
            final String? chatId = state.pathParameters['chatId'];

            return ScreenFactory.renderChatEditPage(
              chatId: int.tryParse(chatId ?? '-1') ?? -1,
            );
          },
        ),
      ],
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScreenFactory.renderBottomNavBar(navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRoutes.contacts.name,
              path: AppRoutes.contacts.path,
              builder: (context, state) => ScreenFactory.renderContactsPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRoutes.chats.name,
              path: AppRoutes.chats.path,
              builder: (context, state) {
                return ScreenFactory.renderChatsListingPage();
              },
              routes: [
                GoRoute(
                  path: AppRoutes.archivedChats.name,
                  name: AppRoutes.archivedChats.name,
                  builder: (context, state) {
                    return ScreenFactory.renderArchivedChatsPage();
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRoutes.settings.name,
              path: AppRoutes.settings.path,
              builder: (context, state) => ScreenFactory.renderSettingsPage(),
            ),
          ],
        ),
      ],
    ),
  ];
}

enum AppRoutes {
  root('/'),
  auth('/auth'),
  login('/auth/login'),
  registration('/auth/registration'),
  chats('/chats'),
  archivedChats('/chats/archivedChats'),
  chat('/chat/:chatId'),
  chatEdit('/chat/:chatId/chatEdit'),
  settings('/settings'),
  appearanceSettings('/settings/appearance'),
  editSettings('/settings/edit'),
  contacts('/contacts');

  const AppRoutes(this.path);

  final String path;
}
