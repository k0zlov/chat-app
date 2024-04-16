import 'package:chat_app/core/widgets/screens/screen_with_search_bar.dart';
import 'package:chat_app/features/contacts/view/widgets/contacts_list.dart';
import 'package:chat_app/features/contacts/view/widgets/contacts_sliver_app_bar.dart';
import 'package:flutter/cupertino.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return ScreenWithSearchAppBar(
      searchAppBar: ContactsSliverAppBar(focusNode: focusNode),
      sliverBody: const ContactsList(),
      focusNode: focusNode,
    );
  }
}
