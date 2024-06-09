part of 'contacts_cubit.dart';

/// Represents the state for contacts management.
///
/// This class encapsulates the various parameters and flags
/// that define the current state of contacts in the application.
@immutable
class ContactsState {
  /// Creates an instance of [ContactsState].
  ///
  /// Parameters:
  ///   [searchText] The text used for searching contacts, defaults to an empty string.
  ///   [emailText] The email text input for adding contacts, defaults to an empty string.
  ///   [contactsLoading] Indicates if contacts are currently being loaded, defaults to true.
  ///   [searchingContacts] Indicates if a search operation is currently in progress, defaults to false.
  ///   [contacts] The list of contacts, defaults to an empty list.
  ///   [searchedContacts] The list of searched contacts, defaults to an empty list.
  ///   [sortOption] The contacts sort mechanism, defaults to [ContactsSort.byLastActivity].
  const ContactsState({
    this.searchText = '',
    this.emailText = '',
    this.contactsLoading = true,
    this.searchingContacts = false,
    this.contacts = const <ContactEntity>[],
    this.searchedContacts = const <ContactEntity>[],
    this.sortOption = ContactsSort.byLastActivity,
  });

  /// The email text input for adding contacts.
  final String emailText;

  /// The text used for searching contacts.
  final String searchText;

  /// Indicates if contacts are currently being loaded.
  final bool contactsLoading;

  /// Indicates if a search operation is currently in progress.
  final bool searchingContacts;

  /// The list of contacts.
  final List<ContactEntity> contacts;

  /// The list of searched contacts.
  final List<ContactEntity> searchedContacts;

  /// Indicates current contacts sorting mechanism
  final ContactsSort sortOption;

  /// Creates a copy of the current state with updated values.
  ///
  /// Parameters:
  ///   [emailText] The new value for [emailText].
  ///   [searchText] The new value for [searchText].
  ///   [contactsLoading] The new value for [contactsLoading].
  ///   [searchingContacts] The new value for [searchingContacts].
  ///   [contacts] The new value for [contacts].
  ///   [searchedContacts] The new value for [searchedContacts].
  ///   [sortOption] The new value for [sortOption].
  ///
  /// Returns:
  ///   A new instance of [ContactsState] with the updated values.
  ContactsState copyWith({
    String? emailText,
    String? searchText,
    bool? contactsLoading,
    bool? searchingContacts,
    List<ContactEntity>? contacts,
    List<ContactEntity>? searchedContacts,
    ContactsSort? sortOption,
  }) {
    return ContactsState(
      emailText: emailText ?? this.emailText,
      searchText: searchText ?? this.searchText,
      contactsLoading: contactsLoading ?? this.contactsLoading,
      searchingContacts: searchingContacts ?? this.searchingContacts,
      contacts: contacts ?? this.contacts,
      searchedContacts: searchedContacts ?? this.searchedContacts,
      sortOption: sortOption ?? this.sortOption,
    );
  }
}

/// Enum for contacts sorting mechanism
enum ContactsSort {
  /// Sorts by first letter of the name
  byName,

  /// Sorts by last activity of contact
  byLastActivity,
}
