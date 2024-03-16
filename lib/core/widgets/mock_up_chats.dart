import 'package:chat_app/core/network/network.dart';
import 'package:chat_app/di_container.dart';
import 'package:chat_app/features/auth/view/widgets/submit_button.dart';
import 'package:flutter/material.dart';

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