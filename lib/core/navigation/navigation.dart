import 'package:chat_app/di_container.dart';
import 'package:chat_app/features/auth/view/cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:chat_app/features/auth/view/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppNavigation {
  static GoRouter get router => GoRouter(
        initialLocation: AppRoutes.registration.path,
        redirect: (BuildContext context, GoRouterState state) {
          // if (state.path == '/') {
          //   return _initialLocation;
          // }
          return null;
        },
        routes: _routes,
      );

  static final List<RouteBase> _routes = <RouteBase>[
    /// Bottom nav bar
    ShellRoute(
      builder: (context, state, child) => MockUpNavBar(child: child),
      routes: [
        /// Chats
        GoRoute(
          name: AppRoutes.chats.name,
          path: AppRoutes.chats.path,
          builder: (context, state) => const MockUpChats(),
        ),

        /// Settings
        GoRoute(
          name: AppRoutes.settings.name,
          path: AppRoutes.settings.path,
          builder: (context, state) => const MockUpPage(title: 'Settings'),
        ),

        /// Contacts
        GoRoute(
          name: AppRoutes.contacts.name,
          path: AppRoutes.contacts.path,
          builder: (context, state) => const MockUpPage(title: 'Contacts'),
        ),
      ],
    ),

    GoRoute(
      name: AppRoutes.registration.name,
      path: AppRoutes.registration.path,
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<SignUpCubit>.value(
              value: getIt<SignUpCubit>(),
            ),
          ],
          child: const SignUpScreen(),
        );
      },
    ),

    /// Chat
    GoRoute(
      name: AppRoutes.chat.name,
      path: AppRoutes.chat.path,
      builder: (context, state) {
        final chatId = state.pathParameters['chatId'];
        return MockUpDeepPage(title: 'This is chat $chatId');
      },
      routes: <RouteBase>[
        /// Chat details
        GoRoute(
          name: AppRoutes.chatSettings.name,
          path: AppRoutes.chatSettings.path,
          builder: (context, state) {
            final chatId = state.pathParameters['chatId'];
            return const MockUpWidget();
          },
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

class MockUpDeepPage extends StatelessWidget {
  const MockUpDeepPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => context.push(AppRoutes.chats.path),
        ),
      ),
      body: Center(
        child: Text(title),
      ),
    );
  }
}

class MockUpChats extends StatelessWidget {
  const MockUpChats({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: ListView.separated(
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8),
            child: ListTile(
              tileColor: Colors.blueAccent,
              onTap: () => context.goNamed(
                AppRoutes.chat.name,
                pathParameters: {'chatId': '$index'},
              ),
              title: Text('This is $index chat'),
            ),
          ),
          separatorBuilder: (context, index) => const Divider(thickness: 1),
          itemCount: 20,
        ),
      ),
    );
  }
}

class MockUpNavBar extends StatefulWidget {
  const MockUpNavBar({super.key, required this.child});

  final Widget child;

  @override
  State<MockUpNavBar> createState() => _MockUpNavBarState();
}

class _MockUpNavBarState extends State<MockUpNavBar> {
  int _selectedPage = 1;

  void _itemSelected(int index) {
    _selectedPage = index;
    setState(() {});

    switch (index) {
      case 0:
        context.goNamed(AppRoutes.contacts.name);
      case 1:
        context.goNamed(AppRoutes.chats.name);
      case 2:
        context.goNamed(AppRoutes.settings.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _itemSelected,
        currentIndex: _selectedPage,
        items: const [
          BottomNavigationBarItem(
            label: 'Contacts',
            icon: Icon(Icons.contacts),
          ),
          BottomNavigationBarItem(
            label: 'Chats',
            icon: Icon(Icons.chat),
          ),
          BottomNavigationBarItem(
            label: 'Settings',
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}

class MockUpPage extends StatelessWidget {
  const MockUpPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'This is $title page',
          style: const TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}

/// Mockup widget for navigation class
class MockUpWidget extends StatelessWidget {
  /// Constructor for [MockUpWidget]
  const MockUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
