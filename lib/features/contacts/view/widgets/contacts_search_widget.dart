import 'package:chat_app/core/widgets/search/no_results_search.dart';
import 'package:chat_app/core/widgets/search/search_results_header.dart';
import 'package:chat_app/features/contacts/domain/entities/contact_entity/contact_entity.dart';
import 'package:chat_app/features/contacts/view/cubit/contacts_cubit.dart';
import 'package:chat_app/features/contacts/view/widgets/contacts_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsSearchWidget extends StatelessWidget {
  const ContactsSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ContactsState state = context.select(
      (ContactsCubit cubit) => cubit.state,
    );

    final List<ContactEntity> filteredContacts = state.contacts
        .where(
          (contact) => contact.name
              .toLowerCase()
              .contains(state.searchText.toLowerCase()),
        )
        .toList();

    return SliverList.list(
      children: [
        if (filteredContacts.isEmpty) ...{
          NoResultsSearchWidget(searchText: state.searchText),
        } else ...{
          const SearchResultsHeader(title: 'Contacts'),
          CupertinoListSection(
            topMargin: 0,
            children: [
              for (int i = 0; i < filteredContacts.length; i++) ...{
                ContactsListItem(
                  key: ValueKey(filteredContacts[i].email),
                  title: filteredContacts[i].name,
                  subtitle: 'last seen 5 minutes ago',
                  backgroundColor: Colors.transparent,
                  onPressed: () {},
                ),
              },
            ],
          ),
        },
      ],
    );
  }
}
