import 'package:chat_app/core/navigation/navigation_stream.dart';
import 'package:chat_app/core/network/network.dart';
import 'package:chat_app/core/screen_factory/screen_factory.dart';
import 'package:chat_app/di_container.dart';
import 'package:chat_app/features/auth/view/cubit/auth_cubit/auth_cubit.dart';
import 'package:chat_app/features/auth/view/widgets/submit_button.dart';
import 'package:chat_app/utils/hive/hive_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppNavigation {
  AppNavigation._();

  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter get router => GoRouter(
        routerNeglect: true,
        initialLocation: AppRoutes.root.path,
        navigatorKey: rootNavigatorKey,
        refreshListenable: NavigationRefreshStream(
          stream: getIt<AuthCubit>().stream,
        ),
        redirect: (BuildContext context, GoRouterState state) {
          final String location = state.matchedLocation;

          final bool isAuthPage = location == AppRoutes.login.path ||
              location == AppRoutes.registration.path;

          final bool isAuthorized = getIt<HiveBoxMixin>().isAuthorized;

          if (isAuthPage && isAuthorized) {
            return AppRoutes.chats.path;
          }

          if (!isAuthorized && !isAuthPage) {
            return AppRoutes.login.path;
          }

          if (state.matchedLocation == '/') {
            return AppRoutes.login.path;
          }
          return null;
        },
        routes: _routes,
      );

  static final List<RouteBase> _routes = <RouteBase>[
    GoRoute(
      name: AppRoutes.login.name,
      path: AppRoutes.login.path,
      builder: (context, state) => ScreenFactory.renderLoginScreen(),
    ),
    GoRoute(
      name: AppRoutes.registration.name,
      path: AppRoutes.registration.path,
      builder: (context, state) => ScreenFactory.renderRegistrationScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MockUpNavBar(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRoutes.contacts.name,
              path: AppRoutes.contacts.path,
              builder: (context, state) => const MockUpWidget(
                title: 'Contacts',
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRoutes.chats.name,
              path: AppRoutes.chats.path,
              builder: (context, state) => const MockUpChats(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRoutes.settings.name,
              path: AppRoutes.settings.path,
              builder: (context, state) => const MockUpSettings(),
            ),
          ],
        ),
      ],
    ),
  ];
}

enum AppRoutes {
  root('/'),
  login('/login'),
  registration('/registration'),
  chats('/chats'),
  chat('/chat/:chatId'),
  chatSettings('chat-settings'),
  settings('/settings'),
  contacts('/contacts');

  const AppRoutes(this.path);

  final String path;
}

class MockUpChats extends StatelessWidget {
  const MockUpChats({super.key});

  Future<void> _onTap() async {
    final response = await getIt<Network>().get(
      url: '/posts',
      queryParameters: {},
      parser: (json) => json,
    );

    print(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Chats page',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 15),
            SubmitButton(
              title: 'Get posts',
              width: 200,
              height: 60,
              onPressed: () async => _onTap(),
              color: Colors.yellowAccent,
            ),
          ],
        ),
      ),
    );
  }
}

class MockUpSettings extends StatelessWidget {
  const MockUpSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthCubit cubit = context.read<AuthCubit>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Settings page',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 15),
            SubmitButton(
              title: 'Logout',
              width: 200,
              height: 60,
              onPressed: () async => cubit.logout(),
              color: Colors.redAccent,
            ),
          ],
        ),
      ),
    );
  }
}

class MockUpWidget extends StatelessWidget {
  const MockUpWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}

class MockUpNavBar extends StatelessWidget {
  const MockUpNavBar({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: _onTap,
      ),
    );
  }
}
