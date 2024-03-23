import 'package:chat_app/core/navigation/navigation.dart';
import 'package:chat_app/core/widgets/buttons/cupertino_submit_button.dart';
import 'package:chat_app/features/auth/view/widgets/info_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoScrollbar(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 5),
              const SizedBox(height: 20),
              const InitialInfoPageView(),
              const SizedBox(height: 100),
              CupertinoSubmitButton(
                label: 'Start Messaging',
                onPressed: () => context.go(AppRoutes.registration.path),
              ),
              const SizedBox(height: 10),
              CupertinoSubmitButton(
                label: 'Continue in {language}',
                color: Colors.transparent,
                textColor: Colors.green,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
