import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/features/contacts/domain/entities/contact_entity/contact_entity.dart';
import 'package:chat_app/features/contacts/domain/entities/contacts_response_entity/contacts_response_entity.dart';
import 'package:chat_app/features/contacts/domain/use_cases/add_contact_use_case/add_contact_use_case.dart';
import 'package:chat_app/features/contacts/domain/use_cases/remove_contact_use_case/remove_contact_use_case.dart';
import 'package:chat_app/features/contacts/domain/use_cases/search_contacts_use_case/search_contacts_use_case.dart';
import 'package:dartz/dartz.dart';

/// Defines the contract for a repository handling contact-related operations.
///
/// This abstract class provides methods to interact with contacts data,
/// including fetching, saving, deleting, and searching contacts. It ensures
/// that different data sources (remote or local) can be used interchangeably
/// through the implementation of this interface.
abstract interface class ContactsRepository {
  /// Fetches all contacts from the repository.
  ///
  /// This method retrieves contacts from a remote or local source,
  /// ensuring the most up-to-date data is provided.
  ///
  /// Returns:
  ///   A Future that resolves to an Either type, containing a [Failure] in case of
  ///   an error, or a [ContactsResponseEntity] instance in case of success.
  Future<Either<Failure, ContactsResponseEntity>> fetchContacts();

  /// Retrieves the saved contacts from the repository.
  ///
  /// This method fetches contacts stored locally.
  ///
  /// Returns:
  ///   A Future that resolves to an Either type, containing a [Failure] in case of
  ///   an error, or a [ContactsResponseEntity] instance in case of success.
  Future<Either<Failure, ContactsResponseEntity>> getSavedContacts();

  /// Deletes all saved contacts from the repository.
  ///
  /// This method removes all contacts stored locally.
  ///
  /// Returns:
  ///   A Future that resolves to an Either type, containing a [Failure] in case of
  ///   an error, or void in case of success.
  Future<Either<Failure, void>> deleteSavedContacts();

  /// Adds a new contact to the repository.
  ///
  /// This method saves a new contact using the provided parameters.
  ///
  /// Parameters:
  ///   [params] The parameters for adding the contact.
  ///
  /// Returns:
  ///   A Future that resolves to an Either type, containing a [Failure] in case of
  ///   an error, or a [ContactEntity] instance in case of success.
  Future<Either<Failure, ContactEntity>> addContact(
    AddContactParams params,
  );

  /// Removes a contact from the repository.
  ///
  /// This method deletes a contact using the provided parameters.
  ///
  /// Parameters:
  ///   [params] The parameters containing the contact's email to remove.
  ///
  /// Returns:
  ///   A Future that resolves to an Either type, containing a [Failure] in case of
  ///   an error, or void in case of success.
  Future<Either<Failure, void>> removeContact(
    RemoveContactParams params,
  );

  /// Searches for contacts in the repository.
  ///
  /// This method searches for contacts using the provided parameters,
  /// including the search criteria.
  ///
  /// Parameters:
  ///   [params] The parameters for searching contacts.
  ///
  /// Returns:
  ///   A Future that resolves to an Either type, containing a [Failure] in case of
  ///   an error, or a [ContactsResponseEntity] instance in case of success.
  Future<Either<Failure, ContactsResponseEntity>> searchContacts(
    SearchContactsParams params,
  );
}
