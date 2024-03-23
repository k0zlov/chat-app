import 'package:chat_app/core/widgets/buttons/cupertino_submit_button.dart';
import 'package:chat_app/features/auth/view/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MockUpSettings extends StatelessWidget {
  const MockUpSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthCubit cubit = context.read<AuthCubit>();

    // Future<void> breakToken() async {
    //   await getIt<AuthService>().login(
    //     accessToken: 'broken_accessToken',
    //     refreshToken: getIt<AuthService>().getRefreshToken ?? '',
    //   );
    //
    //   print('BROKEN ACCESS TOKEN:${getIt<AuthService>().getAccessToken}');
    // }

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
            CupertinoSubmitButton(
              label: 'Logout',
              width: 300,
              onPressed: () async => cubit.logout(),
              color: Colors.redAccent,
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
