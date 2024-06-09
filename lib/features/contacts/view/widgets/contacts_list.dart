import 'package:chat_app/core/widgets/search/search_results_header.dart';
import 'package:chat_app/features/contacts/domain/entities/contact_entity/contact_entity.dart';
import 'package:chat_app/features/contacts/view/cubit/contacts_cubit.dart';
import 'package:chat_app/features/contacts/view/widgets/contacts_list_item.dart';
import 'package:collection/collection.dart';
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
        CupertinoListSection(
          topMargin: 0,
          margin: EdgeInsets.zero,
          children: [
            ContactsListItem(
              title: 'Find People Nearby',
              onPressed: () {},
              showStatus: false,
              leading: const Icon(
                CupertinoIcons.map_pin_ellipse,
                size: 28,
              ),
            ),
            ContactsListItem(
              title: 'Invite Friends',
              onPressed: () {},
              showStatus: false,
              leading: const Icon(
                CupertinoIcons.person_add,
                size: 28,
              ),
            ),
          ],
        ),
        if (state.sortOption == ContactsSort.byName) ...{
          _SortByName(contacts: contacts),
        } else ...{
          _SortByLastActivity(contacts: contacts),
        },
      ],
    );
  }
}

class _SortByName extends StatelessWidget {
  const _SortByName({
    required this.contacts,
  });

  final List<ContactEntity> contacts;

  @override
  Widget build(BuildContext context) {
    final Map<String, List<ContactEntity>> contactMap = {};

    for (final ContactEntity contact in contacts) {
      final String firstLetter =
          contact.name.isNotEmpty ? contact.name[0].toUpperCase() : '#';
      if (!contactMap.containsKey(firstLetter)) {
        contactMap[firstLetter] = [];
      }
      contactMap[firstLetter]!.add(contact);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...contactMap.entries.map((e) {
          return Column(
            children: [
              CupertinoListSection(
                topMargin: 0,
                margin: EdgeInsets.zero,
                children: [
                  SearchResultsHeader(title: e.key),
                  ...e.value.map((contact) {
                    return ContactsListItem(
                      title: contact.name,
                      lastActivity: contact.lastActivityAt,
                      onPressed: () {},
                    );
                  }),
                ],
              ),
            ],
          );
        }),
      ],
    );
  }
}

class _SortByLastActivity extends StatelessWidget {
  const _SortByLastActivity({
    required this.contacts,
  });

  final List<ContactEntity> contacts;

  @override
  Widget build(BuildContext context) {
    final List<ContactEntity> sortedContacts = contacts.sorted((a, b) {
      final DateTime? first = a.lastActivityAt;
      final DateTime? second = b.lastActivityAt;

      if (first == second) return 0;

      if (first == null) return -1;

      if (second == null) return 1;

      return second.compareTo(first);
    });

    return CupertinoListSection(
      topMargin: 0,
      children: [
        for (final ContactEntity contact in sortedContacts) ...{
          ContactsListItem(
            title: contact.name,
            lastActivity: contact.lastActivityAt,
            onPressed: () {},
          ),
        },
      ],
    );
  }
}
