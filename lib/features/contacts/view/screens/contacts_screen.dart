import 'package:chat_app/core/widgets/screens/screen_with_search_bar.dart';
import 'package:chat_app/features/contacts/view/cubit/contacts_cubit.dart';
import 'package:chat_app/features/contacts/view/widgets/contacts_list.dart';
import 'package:chat_app/features/contacts/view/widgets/contacts_search_widget.dart';
import 'package:chat_app/features/contacts/view/widgets/contacts_sliver_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ContactsState state = context.select(
      (ContactsCubit cubit) => cubit.state,
    );

    return ScreenWithSearchAppBar(
      searchAppBar: ContactsSliverAppBar(focusNode: _focusNode),
      sliverBody: const ContactsList(),
      focusNode: _focusNode,
      showSearchWidget: state.searchText != '',
      searchWidget: const ContactsSearchWidget(),
    );
  }
}
