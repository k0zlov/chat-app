import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/network/api_endpoints.dart';
import 'package:chat_app/core/network/network.dart';
import 'package:chat_app/features/contacts/data/models/contact_model/contact_model.dart';
import 'package:chat_app/features/contacts/data/models/contacts_response_model/contacts_response_model.dart';
import 'package:chat_app/features/contacts/domain/use_cases/add_contact_use_case/add_contact_use_case.dart';
import 'package:chat_app/features/contacts/domain/use_cases/remove_contact_use_case/remove_contact_use_case.dart';
import 'package:chat_app/features/contacts/domain/use_cases/search_contacts_use_case/search_contacts_use_case.dart';
import 'package:dartz/dartz.dart';

abstract interface class ContactsRemoteProvider {
  Future<Either<Failure, ContactsResponseModel>> getAllContacts();

  Future<Either<Failure, ContactModel>> addContact(
    AddContactParams params,
  );

  Future<Either<Failure, void>> removeContact(
    RemoveContactParams params,
  );

  Future<Either<Failure, ContactsResponseModel>> searchContacts(
    SearchContactsParams params,
  );
}

class ContactsRemoteProviderImpl implements ContactsRemoteProvider {
  const ContactsRemoteProviderImpl({
    required this.network,
  });

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
