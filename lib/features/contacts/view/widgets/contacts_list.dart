import 'package:chat_app/features/contacts/domain/entities/contact_entity/contact_entity.dart';
import 'package:chat_app/features/contacts/view/cubit/contacts_cubit.dart';
import 'package:chat_app/features/contacts/view/widgets/contacts_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        CupertinoListSection(
          topMargin: 0,
          backgroundColor: Colors.transparent,
          children: [
            if (state.searchText == '') ...{
              ContactsListItem(
                title: 'Find People Nearby',
                onPressed: () {},
                leading: const Icon(
                  CupertinoIcons.map_pin_ellipse,
                  size: 28,
                ),
              ),
              ContactsListItem(
                title: 'Invite Friends',
                onPressed: () {},
                leading: const Icon(
                  CupertinoIcons.person_add,
                  size: 28,
                ),
              ),
            },
            for (final contact in contacts) ...{
              ContactsListItem(
                title: contact.name,
                onPressed: () {},
                subtitle: 'last seen 5 minutes ago',
              ),
            },
          ],
        ),
        if (state.contactsLoading) ...{
          const Column(
            children: [
              SizedBox(height: 50),
              CupertinoActivityIndicator(),
            ],
          ),
        },
      ],
    );
  }
}
