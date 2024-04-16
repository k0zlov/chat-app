import 'package:chat_app/core/resources/palette.dart';
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
        .where((contact) => contact.name.contains(state.searchText))
        .toList();

    final Color textColor =
        CupertinoTheme.of(context).brightness == Brightness.dark
            ? AppPalette.darkText.withOpacity(0.5)
            : AppPalette.lightText.withOpacity(0.5);

    final textStyle = CupertinoTheme.of(context).textTheme.textStyle.copyWith(
          color: textColor,
          fontWeight: FontWeight.w400,
          fontSize: 12,
        );

    final Brightness? brightness = CupertinoTheme.of(context).brightness;

    final Color contactColor = brightness == Brightness.dark
        ? Colors.transparent
        : CupertinoColors.white;

    return SliverList.list(
      children: [
        if (filteredContacts.isNotEmpty) ...{
          Container(
            height: 30,
            color: CupertinoTheme.of(context).barBackgroundColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text('CONTACTS', style: textStyle),
            ),
          ),
        },
        if (filteredContacts.isEmpty) ...{
          DefaultTextStyle(
            style: textStyle.copyWith(fontSize: 16),
            child: Column(
              children: [
                const SizedBox(height: 100),
                Text('There were no results for "${state.searchText}"'),
                const SizedBox(height: 4),
                const Text('Try a new search'),
              ],
            ),
          ),
        } else ...{
          for (int i = 0; i < filteredContacts.length; i++) ...{
            if (filteredContacts[i].name.contains(state.searchText)) ...{
              ContactsListItem(
                key: ValueKey(filteredContacts[i].email),
                backgroundColor: contactColor,
                title: filteredContacts[i].name,
                hasDivider: i != filteredContacts.length - 1,
                subtitle: 'last seen 5 minutes ago',
              ),
            },
          },
        },
      ],
    );
  }
}
