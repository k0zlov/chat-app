import 'package:chat_app/features/contacts/view/widgets/contacts_list.dart';
import 'package:chat_app/features/contacts/view/widgets/contacts_sliver_app_bar.dart';
import 'package:flutter/cupertino.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return const CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      child: CustomScrollView(
        slivers: [
          ContactsSliverAppBar(),
          ContactsList(),
        ],
      ),
    );
  }
}
