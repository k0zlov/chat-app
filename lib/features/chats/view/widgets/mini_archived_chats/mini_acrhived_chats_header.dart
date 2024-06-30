import 'package:chat_app/core/navigation/navigation.dart';
import 'package:chat_app/core/resources/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class MiniAcrhivedChatsHeader extends StatelessWidget {
  const MiniAcrhivedChatsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = CupertinoTheme.of(context);

    final double width = MediaQuery.of(context).size.width * .95;

    final textStyle = theme.textTheme.textStyle.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w400,
    );

    return Container(
      height: 50,
      width: width,
      color: theme.barBackgroundColor.withOpacity(0.74),
      child: Stack(
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                context
                  ..pop()
                  ..goNamed(AppRoutes.archivedChats.name);
              },
              child: Text('Archived chats', style: textStyle),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(AppImages.archivedChats, height: 110),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
