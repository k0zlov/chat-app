part of 'contacts_cubit.dart';

@immutable
class ContactsState {
  const ContactsState({
    this.searchText = '',
    this.emailText = '',
    this.contactsLoading = true,
    this.searchingContacts = false,
    this.contacts = const <ContactEntity>[],
    this.searchedContacts = const <ContactEntity>[],
  });

  final String emailText;
  final String searchText;

  final bool contactsLoading;
  final bool searchingContacts;

  final List<ContactEntity> contacts;
  final List<ContactEntity> searchedContacts;

  ContactsState copyWith({
    String? emailText,
    String? searchText,
    bool? contactsLoading,
    bool? searchingContacts,
    List<ContactEntity>? contacts,
    List<ContactEntity>? searchedContacts,
  }) {
    return ContactsState(
      emailText: emailText ?? this.emailText,
      searchText: searchText ?? this.searchText,
      contactsLoading: contactsLoading ?? this.contactsLoading,
      searchingContacts: searchingContacts ?? this.searchingContacts,
      contacts: contacts ?? this.contacts,
      searchedContacts: searchedContacts ?? this.searchedContacts,
    );
  }
}
