import 'package:flutter/material.dart';

class MockUpContacts extends StatelessWidget {
  const MockUpContacts({super.key});


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Contacts',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}