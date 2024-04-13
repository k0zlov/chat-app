import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/features/contacts/domain/entities/contact_entity/contact_entity.dart';
import 'package:chat_app/features/contacts/domain/entities/contacts_response_entity/contacts_response_entity.dart';
import 'package:chat_app/features/contacts/domain/use_cases/add_contact_use_case/add_contact_use_case.dart';
import 'package:chat_app/features/contacts/domain/use_cases/remove_contact_use_case/remove_contact_use_case.dart';
import 'package:dartz/dartz.dart';

abstract interface class ContactsRepository {
  Future<Either<Failure, ContactsResponseEntity>> getAllContacts();

  Future<Either<Failure, ContactEntity>> addContact(AddContactParams params);

  Future<Either<Failure, void>> removeContact(RemoveContactParams params);
}
