import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/network/api_endpoints.dart';
import 'package:chat_app/core/network/network.dart';
import 'package:chat_app/features/contacts/data/models/contact_model/contact_model.dart';
import 'package:chat_app/features/contacts/data/models/contacts_response_model/contacts_response_model.dart';
import 'package:chat_app/features/contacts/domain/use_cases/add_contact_use_case/add_contact_use_case.dart';
import 'package:chat_app/features/contacts/domain/use_cases/remove_contact_use_case/remove_contact_use_case.dart';
import 'package:chat_app/features/contacts/domain/use_cases/search_contacts_use_case/search_contacts_use_case.dart';
import 'package:dartz/dartz.dart';

/// Defines the contract for remote operations related to contacts.
///
/// This abstract class provides methods to interact with a remote server
/// for retrieving, adding, removing, and searching contacts.
abstract interface class ContactsRemoteProvider {
  /// Retrieves all contacts from the remote server.
  ///
  /// Returns:
  ///   A Future that resolves to an Either type, containing a [Failure] in case of
  ///   an error, or a [ContactsResponseModel] instance in case of success.
  Future<Either<Failure, ContactsResponseModel>> getAllContacts();

  /// Adds a new contact to the remote server.
  ///
  /// Parameters:
  ///   [params] The parameters for adding the contact.
  ///
  /// Returns:
  ///   A Future that resolves to an Either type, containing a [Failure] in case of
  ///   an error, or a [ContactModel] instance in case of success.
  Future<Either<Failure, ContactModel>> addContact(
    AddContactParams params,
  );

  /// Removes a contact from the remote server.
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

  /// Searches for contacts on the remote server.
  ///
  /// Parameters:
  ///   [params] The parameters for searching contacts, including the search criteria.
  ///
  /// Returns:
  ///   A Future that resolves to an Either type, containing a [Failure] in case of
  ///   an error, or a [ContactsResponseModel] instance in case of success.
  Future<Either<Failure, ContactsResponseModel>> searchContacts(
    SearchContactsParams params,
  );
}

/// Implementation of [ContactsRemoteProvider] that interacts with a remote server.
///
/// This class provides concrete implementations for retrieving, adding, removing,
/// and searching contacts using a remote server. It leverages the [Network] class
/// for network operations.
class ContactsRemoteProviderImpl implements ContactsRemoteProvider {
  /// Creates an instance of [ContactsRemoteProviderImpl].
  ///
  /// Parameters:
  ///   [network] The [Network] instance to use for network operations.
  const ContactsRemoteProviderImpl({
    required this.network,
  });

  /// The [Network] instance for network operations.
  final Network network;

  @override
  Future<Either<Failure, ContactsResponseModel>> getAllContacts() async {
    final response = await network.get(
      url: ApiEndpoints.getContacts,
      parser: (json) {
        final data = json as Map<String, dynamic>;

        return ContactsResponseModel.fromJson(data);
      },
    );
    return response;
  }

  @override
  Future<Either<Failure, ContactModel>> addContact(
    AddContactParams params,
  ) async {
    final response = await network.post(
      url: ApiEndpoints.postContactAdd,
      data: params.toJson(),
      parser: (json) {
        final data = json as Map<String, dynamic>;

        return ContactModel.fromJson(data);
      },
    );
    return response;
  }

  @override
  Future<Either<Failure, void>> removeContact(
    RemoveContactParams params,
  ) async {
    final response = await network.delete(
      url: ApiEndpoints.deleteContactRemove,
      queryParameters: params.toJson(),
      parser: (json) => null,
    );
    return response;
  }

  @override
  Future<Either<Failure, ContactsResponseModel>> searchContacts(
    SearchContactsParams params,
  ) async {
    final response = await network.get(
      url: ApiEndpoints.getContactsSearch,
      queryParameters: {
        'username': params.name,
      },
      parser: (json) {
        final data = json as Map<String, dynamic>;
        return ContactsResponseModel.fromJson(data);
      },
    );

    return response;
  }
}
