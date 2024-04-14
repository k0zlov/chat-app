import 'package:chat_app/features/contacts/view/cubit/contacts_cubit.dart';
import 'package:chat_app/features/contacts/view/widgets/contacts_list.dart';
import 'package:chat_app/features/contacts/view/widgets/contacts_sliver_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ContactsCubit cubit = context.read<ContactsCubit>();

    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      navigationBar: CupertinoNavigationBar(
        border: null,
        leading: CupertinoButton(
          onPressed: cubit.loadAllContacts,
          child: const Icon(CupertinoIcons.refresh, size: 22),
        ),
        middle: const Padding(
          padding: EdgeInsets.only(top: 8),
          child: Text('Contacts'),
        ),
      ),
      child: const CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.only(top: 20),
            sliver: ContactsSliverAppBar(),
          ),
          ContactsList(),
        ],
      ),
    );
  }
}
