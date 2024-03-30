import 'package:chat_app/core/widgets/buttons/cupertino_submit_button.dart';
import 'package:chat_app/features/auth/view/cubit/auth_cubit.dart';
import 'package:chat_app/features/settings/settings_feature.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MockUpSettings extends StatelessWidget {
  const MockUpSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthCubit authCubit = context.read<AuthCubit>();
    final SettingsCubit settingsCubit = context.read<SettingsCubit>();

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
              onPressed: () async => authCubit.logout(),
              color: Colors.redAccent,
            ),
            const SizedBox(height: 30),
            CupertinoSubmitButton(
              label: 'Switch using system mode',
              width: 400,
              onPressed: settingsCubit.switchUsingSystemMode,
              color: Colors.orangeAccent,
            ),
            const SizedBox(height: 30),
            CupertinoSubmitButton(
              label: 'Switch theme mode',
              width: 400,
              onPressed: settingsCubit.switchThemeMode,
              color: Colors.greenAccent,
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
