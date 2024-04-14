import 'package:chat_app/core/database/database_helper.dart';
import 'package:chat_app/core/database/tables.dart';
import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/features/contacts/data/models/contact_model/contact_model.dart';
import 'package:chat_app/features/contacts/data/models/contacts_response_model/contacts_response_model.dart';
import 'package:chat_app/features/contacts/domain/use_cases/remove_contact_use_case/remove_contact_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

abstract interface class ContactsLocalProvider {
  Future<Either<Failure, ContactsResponseModel>> getSavedContacts();

  Future<Either<Failure, void>> rewriteSavedContacts(
    List<ContactModel> contacts,
  );

  Future<Either<Failure, void>> saveContact(ContactModel model);

  Future<Either<Failure, void>> deleteContact(RemoveContactParams params);
}

class ContactsLocalProviderImpl implements ContactsLocalProvider {
  const ContactsLocalProviderImpl({
    required this.database,
  });

  final DatabaseHelper database;

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
    final Map<String, dynamic> dataToSave = {
      'external_id': model.externalId,
      'name': model.name,
      'email': model.email,
    };

    final response = await database.insert(
      tableName: tableName,
      data: dataToSave,
    );
    return response;
  }

  @override
  Future<Either<Failure, void>> deleteContact(
    RemoveContactParams params,
  ) async {
    final response = await database.delete(
      tableName: tableName,
      where: 'external_id = ?',
      whereArgs: [params.contactUserId],
    );
    return response;
  }

  @override
  Future<Either<Failure, void>> rewriteSavedContacts(
    List<ContactModel> contacts,
  ) async {
    try {
      await database.delete(tableName: tableName);
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
}
