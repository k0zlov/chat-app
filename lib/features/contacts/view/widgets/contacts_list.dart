import 'package:chat_app/features/contacts/domain/entities/contact_entity/contact_entity.dart';
import 'package:chat_app/features/contacts/view/cubit/contacts_cubit.dart';
import 'package:chat_app/features/contacts/view/widgets/contacts_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({super.key});

  @override
  Widget build(BuildContext context) {
    final ContactsState state = context.select(
      (ContactsCubit cubit) => cubit.state,
    );

    final List<ContactEntity> contacts = state.contacts;

    return SliverList.list(
      children: [
        if (state.searchText == '') ...{
          const ContactsListItem(
            title: 'Find People Nearby',
            padding: EdgeInsets.only(right: 9),
            hasDivider: true,
            leading: Icon(
              CupertinoIcons.map_pin_ellipse,
              size: 28,
            ),
          ),
          ContactsListItem(
            title: 'Invite Friends',
            hasDivider: contacts.isNotEmpty,
            padding: const EdgeInsets.only(right: 9),
            leading: const Icon(
              CupertinoIcons.person_add,
              size: 28,
            ),
          ),
        },
        if (state.contactsLoading) ...{
          const Column(
            children: [
              SizedBox(height: 50),
              CupertinoActivityIndicator(),
            ],
          ),
        } else ...{
          for (int i = 0; i < contacts.length; i++) ...{
            ContactsListItem(
              key: ValueKey(contacts[i].email),
              title: contacts[i].name,
              hasDivider: i != contacts.length - 1,
              subtitle: 'last seen 5 minutes ago',
            ),
          },
        },
      ],
    );
  }
}
