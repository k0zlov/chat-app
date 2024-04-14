part of 'contacts_cubit.dart';

@immutable
class ContactsState {
  const ContactsState({
    this.contactsLoading = true,
    this.contacts = const <ContactEntity>[],
  });

  final bool contactsLoading;
  final List<ContactEntity> contacts;

  ContactsState copyWith({
    bool? contactsLoading,
    List<ContactEntity>? contacts,
  }) {
    return ContactsState(
      contactsLoading: contactsLoading ?? this.contactsLoading,
      contacts: contacts ?? this.contacts,
    );
  }
}
