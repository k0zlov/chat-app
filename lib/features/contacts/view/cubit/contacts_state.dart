part of 'contacts_cubit.dart';

@immutable
class ContactsState {
  const ContactsState({
    this.searchText = '',
    this.emailText = '',
    this.contactsLoading = true,
    this.contacts = const <ContactEntity>[],
  });

  final String emailText;
  final String searchText;
  final bool contactsLoading;
  final List<ContactEntity> contacts;

  ContactsState copyWith({
    String? emailText,
    String? searchText,
    bool? contactsLoading,
    List<ContactEntity>? contacts,
  }) {
    return ContactsState(
      emailText: emailText ?? this.emailText,
      searchText: searchText ?? this.searchText,
      contactsLoading: contactsLoading ?? this.contactsLoading,
      contacts: contacts ?? this.contacts,
    );
  }
}
