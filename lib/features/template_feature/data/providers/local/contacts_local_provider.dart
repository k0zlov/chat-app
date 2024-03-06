import 'package:chat_app/core/database/database_handler.dart';
import 'package:chat_app/core/database/tables.dart';
import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/features/template_feature/data/models/contacts_model/contact_model.dart';
import 'package:dartz/dartz.dart';

/// Defines an abstract interface for local data operations related to contacts.
///
/// This interface specifies the necessary operations for managing contacts data
/// in local storage, including retrieval, caching, updating, and deletion of contacts.
abstract interface class ContactsLocalProvider {
  /// Retrieves contacts data from local cache.
  ///
  /// Returns a `Future` that resolves to an `Either` type with a `Failure` on the
  /// left side or a `ContactResponse` on the right side, representing the operation's outcome.
  Future<Either<Failure, ContactResponse>> getCachedContacts();

  /// Caches a contact's data in local storage.
  ///
  /// Requires a `ContactModel` instance that represents the contact data to be cached.
  Future<void> cacheContact({required ContactModel contactModel});

  /// Updates an existing contact's data in local cache.
  ///
  /// Requires a `ContactModel` instance that represents the updated contact data.
  Future<void> updateCachedContact({required ContactModel contactModel});

  /// Deletes a contact's data from local cache.
  ///
  /// Requires a `ContactModel` instance that represents the contact data to be deleted.
  Future<void> deleteCachedContact({required ContactModel contactModel});
}

/// Implements the [ContactsLocalProvider] interface using a local database for data management.
///
/// This class is responsible for executing the defined operations on contacts data,
/// leveraging a local database for storage and retrieval.
class ContactsLocalProviderImpl implements ContactsLocalProvider {
  /// Constructs a [ContactsLocalProviderImpl] with a required [DatabaseHelper].
  ///
  /// The [DatabaseHelper] is utilized for all database interactions.
  ContactsLocalProviderImpl({
    required this.databaseHelper,
  });

  /// The handler for database operations, encapsulating the logic for data manipulation.
  final DatabaseHelper databaseHelper;

  /// The name of the database table used for storing contacts data.
  final String tableName = ContactsTable().tableName;

  @override
  Future<Either<Failure, ContactResponse>> getCachedContacts() async {
    // Retrieves contacts data from the specified table in the local database.
    final response = await databaseHelper.get(
      tableName: tableName,
      parser: ContactResponse.fromJson,
    );
    return response;
  }

  @override
  Future<void> cacheContact({required ContactModel contactModel}) async {
    // Inserts a new contact's data into the local database.
    await databaseHelper.insert(
      tableName: tableName,
      data: contactModel,
      parser: (model) => model.toJson(),
    );
  }

  @override
  Future<void> updateCachedContact({required ContactModel contactModel}) async {
    // Updates an existing contact's data in the local database based on identifiers.
    await databaseHelper.update(
      tableName: tableName,
      data: contactModel,
      parser: (model) => model.toJson(),
      where: 'contactuserid = ? AND userid = ?',
      whereArgs: [contactModel.contactUserId, contactModel.userId],
    );
  }

  @override
  Future<void> deleteCachedContact({required ContactModel contactModel}) async {
    // Deletes a contact's data from the local database based on identifiers.
    await databaseHelper.delete(
      tableName: tableName,
      where: 'contactuserid = ? AND userid = ?',
      whereArgs: [contactModel.contactUserId, contactModel.userId],
    );
  }
}
