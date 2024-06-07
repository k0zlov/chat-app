import 'package:chat_app/core/database/database_helper.dart';
import 'package:chat_app/core/database/tables.dart';
import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/features/contacts/data/models/contact_model/contact_model.dart';
import 'package:chat_app/features/contacts/data/models/contacts_response_model/contacts_response_model.dart';
import 'package:chat_app/features/contacts/domain/use_cases/remove_contact_use_case/remove_contact_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

/// Defines the contract for local storage operations for contacts.
///
/// This abstract class provides methods to interact with the local database
/// for saving, retrieving, and deleting contacts.
abstract interface class ContactsLocalProvider {
  /// Retrieves the saved contacts from the local database.
  ///
  /// Returns:
  ///   A Future that resolves to an Either type, containing a [Failure] in case of
  ///   an error, or a [ContactsResponseModel] instance in case of success.
  Future<Either<Failure, ContactsResponseModel>> getSavedContacts();

  /// Rewrites the saved contacts in the local database.
  ///
  /// This method deletes all existing contacts and replaces them with the provided list.
  ///
  /// Parameters:
  ///   [contacts] The list of contacts to save.
  ///
  /// Returns:
  ///   A Future that resolves to an Either type, containing a [Failure] in case of
  ///   an error, or void in case of success.
  Future<Either<Failure, void>> rewriteSavedContacts(
    List<ContactModel> contacts,
  );

  /// Saves a contact to the local database.
  ///
  /// Parameters:
  ///   [model] The contact model to save.
  ///
  /// Returns:
  ///   A Future that resolves to an Either type, containing a [Failure] in case of
  ///   an error, or void in case of success.
  Future<Either<Failure, void>> saveContact(
    ContactModel model,
  );

  /// Deletes a contact from the local database.
  ///
  /// Parameters:
  ///   [params] The parameters containing the contact's email to delete.
  ///
  /// Returns:
  ///   A Future that resolves to an Either type, containing a [Failure] in case of
  ///   an error, or void in case of success.
  Future<Either<Failure, void>> deleteContact(
    RemoveContactParams params,
  );

  /// Deletes all contacts from the local database.
  ///
  /// Returns:
  ///   A Future that resolves to an Either type, containing a [Failure] in case of
  ///   an error, or void in case of success.
  Future<Either<Failure, void>> deleteAllContacts();
}

/// Implementation of [ContactsLocalProvider] that interacts with a local database.
///
/// This class provides concrete implementations for saving, retrieving, and deleting
/// contacts using a local database. It leverages the [DatabaseHelper] class for
/// database operations.
class ContactsLocalProviderImpl implements ContactsLocalProvider {
  /// Creates an instance of [ContactsLocalProviderImpl].
  ///
  /// Parameters:
  ///   [database] The [DatabaseHelper] instance to use for database operations.
  const ContactsLocalProviderImpl({
    required this.database,
  });

  /// The [DatabaseHelper] instance for database operations.
  final DatabaseHelper database;

  /// The name of the table storing the contacts.
  String get tableName => ContactsTable().tableName;

  @override
  Future<Either<Failure, ContactsResponseModel>> getSavedContacts() async {
    final response = await database.get(
      tableName: tableName,
      parser: ContactsResponseModel.fromJson,
    );

    return response;
  }

  @override
  Future<Either<Failure, void>> saveContact(ContactModel model) async {
    final response = await database.insert(
      tableName: tableName,
      data: model.toJson(),
    );

    return response;
  }

  @override
  Future<Either<Failure, void>> deleteContact(
    RemoveContactParams params,
  ) async {
    final response = await database.delete(
      tableName: tableName,
      where: 'email = ?',
      whereArgs: [params.contactUserEmail],
    );
    return response;
  }

  @override
  Future<Either<Failure, void>> rewriteSavedContacts(
    List<ContactModel> contacts,
  ) async {
    try {
      await deleteAllContacts();
      for (final ContactModel model in contacts) {
        await saveContact(model);
      }
      return const Right(null);
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Error: $e \nStack trace:\n $stackTrace');
      }

      const cacheFailure = CacheFailure(
        errorMessage: 'Could not rewrite saved contacts.',
      );

      return const Left(cacheFailure);
    }
  }

  @override
  Future<Either<Failure, void>> deleteAllContacts() async {
    try {
      await database.delete(tableName: tableName);

      return const Right(null);
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Error: $e \nStack trace:\n $stackTrace');
      }

      const cacheFailure = CacheFailure(
        errorMessage: 'Could not delete all saved contacts.',
      );

      return const Left(cacheFailure);
    }
  }
}
