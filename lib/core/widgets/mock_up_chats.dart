import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MockUpChats extends StatelessWidget {
  const MockUpChats({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 30,
                padding: const EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  if (index == 29) {
                    return const SizedBox(height: 70);
                  }

                  return Container(
                    height: 50,
                    width: 50,
                    color: index.isEven ? Colors.red : Colors.greenAccent,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
