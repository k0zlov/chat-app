import 'package:flutter/material.dart';

class MockUpChats extends StatelessWidget {
  const MockUpChats({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Chats page',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}