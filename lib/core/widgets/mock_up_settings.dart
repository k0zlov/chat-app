import 'package:chat_app/features/auth/view/cubit/auth_cubit/auth_cubit.dart';
import 'package:chat_app/features/auth/view/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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